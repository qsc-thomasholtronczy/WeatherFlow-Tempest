rapidjson = require ("rapidjson")
bitstring = require ("bitstring")

-- Debug Printing


function PrintToDebug(prop, msg)
  local debugMode = Properties["Debug Print"].Value
  local propMap = {
    ["Tx/Rx"] = { "Tx", "Rx" },
    ["Tx"] = { "Tx" },
    ["Rx"] = { "Rx" },
    ["Function Calls"] = { "function" },
    ["All"] = {"tx", "rx", "function" }
  }
local info = debug.getinfo(2, "n")
local caller = info and info.name or "unknown"

  local allowedProps = propMap[debugMode] or {}
  for _, allowed in ipairs(allowedProps) do
    if prop == allowed then
      print(string.format("[%s] %s", caller, msg))
      return
    end
  end
end

-- status flags
statusState = {
  OK = 0,
  COMPROMISED = 1,
  FAULT = 2,
  NOTPRESENT = 3,
  MISSING = 4,
  INITIALIZING = 5
}

--bitstring flags and decode function 
sensorFlags = {
  [0x000] = "Status Good",
  [0x001] = "Lightning Sensor failed",
  [0x002] = "Lightning Sensor noise",
  [0x004] = "Lightning Sensor disturbed",
  [0x008] = "Pressure Sensor failed",
  [0x010] = "Temperature Sensor failed",
  [0x020] = "Humidity Sensor failed",
  [0x040] = "Wind Sensor failed",
  [0x080] = "Rain Sensor failed",
  [0x100] = "Light/UV Sensor failed",
  [0x200] = "Power booster detected",
  [0x8000] = "Power booster depleted",
  [0x10000] = "Power booster shore power"
}

function decodeSensorState(data)
  local status_desc = ""
  PrintToDebug("function", "Decoding Sensor Data")
  if data then 
    PrintToDebug("function", "String Value: "..data)
    local packed = bitstring.pack("32:int:big", data)
    PrintToDebug("function", "Raw Binary value: "..bitstring.binstream(packed))
    for bitmask, description in pairs(sensorFlags) do
      if math.floor(data / bitmask) % 2 == 1 then 
        status_desc = status_desc .. "\n - "..description
        PrintToDebug("function", status_desc)
      end
    end
    if status_desc == "" then 
      status_desc = "All Sensors Good"
    end 
  end
  return status_desc
end 

-- Unit Conversion functions 

function ConvertTime(EPOCH)
  return (os.date("%m/%d/%Y %I:%M%p", EPOCH))
end

function KmToMi(km)
  return(tonumber(km) * 0.621371)
end

function MpsToMph(mps)
  return(tonumber(mps) * 2.23694)
end

function CToF(c)
  return (tonumber(c) * 9/5) + 32
end

function MMToIn(mm)
  return (tonumber(mm) * 0.0393701)
end

function KgToLb(kg)
  return (tonumber(kg) *  0.062427960576145)
end

Controls.Unit.EventHandler = function(ctrl)
  if ctrl.Boolean then
    ctrl.Legend = "Imperial"
  else
    ctrl.Legend = "Metric"
  end
end

if Controls.Unit.Boolean then
  Controls.Unit.Legend = "Imperial"
else
  Controls.Unit.Legend = "Metric"
end

-- Alert Timeouts --
lxLockout = Timer.New()
precipLockout = Timer.New()

lxLockout.EventHandler = function()
  lxLockout:Stop()
end
precipLockout.EventHandler = function()
  precipLockout:Stop()
end

function SetEventsLow()
  Controls["precip-start-event"].Boolean = false
  Controls["lightning-start-event"].Boolean = false
  Controls["wind-start-event"].Boolean = false
end

-- Status Management
function SetStatus(state, msg)
  PrintToDebug("function", "Status Changed to: ".. state, msg)
  Controls["Status"].Value = statusState[state]
  Controls["Status"].String = msg
end
-- Socket Management -- 

if Properties["Connection Method"].Value == "WebSocket" then
  ws = WebSocket.New()
  protocol = "wss"
  host = "ws.weatherflow.com"
  url = "swd/data?token="
  port = 443
  sub_protocol = nil
  headers = {}

  --Build the API Command Table
  listen = {
    start = {
      type = "listen_start",
      device_id = "rand-dev-12345",--Init this to a default value. This is overwritten with the station ID
      id = "rand-id-12345" -- Init this to a default value. This is overwritten with the Timestamp on a new command write
    },
    stop = {
      type = "listen_stop",
      device_id = "rand-dev-12345", --Init this to a default value. This is overwritten with the station ID
      id = "rand-id-12345" -- Init this to a default value. This is overwritten with the Timestamp on a new command write
    },
    rapidStart = {
      type = "listen_rapid_start",
      device_id = "rand-dev-12345", --Init this to a default value. This is overwritten with the station ID
      id = "rand-id-12345" -- Init this to a default value. This is overwritten with the Timestamp on a new command write
    },
    rapidStop = {
      type = "listen_rapid_stop",
      device_id = "rand-dev-12345", --Init this to a default value. This is overwritten with the station ID
      id = "rand-id-12345" -- Init this to a default value. This is overwritten with the Timestamp on a new command write
    },
  }
else
  udp = UdpSocket.New()
  udp.EventHandler = function(udp, packet)
    SetEventsLow()
    ParseData(packet.Data)
    SetStatus("OK"," UDP event received")
  end
end

function ResetConnectionStatus()
  Controls["Connected"].Boolean = false
  Controls["Connect"].Boolean = false
  if Properties["Connection Method"].Value == "WebSocket" then
    Controls["Get Forecast"].IsDisabled = true
    Controls["Get Forecast"].Boolean = false
    Controls["Get Rapid Wind Reports"].IsDisabled = true
    Controls["Get Rapid Wind Reports"].Boolean = false
  end
  SetEventsLow()
end

function Connect()
  PrintToDebug("function", "Starting Connection...")
  if Properties["Connection Method"].Value == "WebSocket" then
    local token = Controls["Access-Token"].String
    if token == nil or token == "" then
      PrintToDebug("function", "Error. Access Token is not set. Please set the Access Token in the Configuration section.")
      return
    end
    local sockURL = string.format("%s%s", url, token)
    ws:Connect(protocol, host, sockURL, port, sub_protocol, headers )
  else
    udp:Open(_, 50222) -- Open the UDP socket on port 50222 with no ip address
  end
  SetStatus("INITIALIZING"," Attempting to Connect...")
  SetEventsLow() 
end

function Disconnect()
  PrintToDebug("function", "Closing Connection...")
  if Properties["Connection Method"].Value == "WebSocket" then
    ws:Close()
  else
    udp:Close()
  end
  SetStatus("NOTPRESENT","  Disconnected from Tempest")
  ResetConnectionStatus()
end

-- WebSocket exclusive connection controls
if Properties["Connection Method"].Value == "WebSocket" then
  function Write(msg)
    local deviceID = Controls["Device-ID"].String
    if deviceID == nil or deviceID == "" then
      PrintToDebug("function","Error. Missing Device ID.")
      return
    end
    listen[msg].device_id = deviceID
    listen[msg].id = string.format("%s", os.time())
    local sockMsg = rapidjson.encode(listen[msg])
    PrintToDebug("Tx", sockMsg)
    ws:Write(sockMsg)
  end

  ws.Connected = function()
    PrintToDebug("Rx", "WebSocket connected")
    Controls.Connected.Boolean = true
    Controls["Get Forecast"].IsDisabled = false
    Controls["Get Rapid Wind Reports"].IsDisabled = false
    SetStatus("OK", " Connected")
  end

  ws.Data = function(ws, packet)
    PrintToDebug("Rx", packet)
    SetEventsLow()
    ParseData(packet)
  end

  ws.Error = function(ws, err)
    PrintToDebug("Rx", err)
    ResetConnectionStatus()
    SetStatus("FAULT", " Websocket error encountered: "..err)
  end

  ws.Closed = function()
    PrintToDebug("Rx", "WebSocket connection closed by host")
    ResetConnectionStatus()
    SetStatus("FAULT", " WebSocket connection closed by host")
  end
end

-- Data Parsing Functions

parsingFunctions = {}

parsingFunctions.evt_precip = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls["precip-start-event"].Boolean = true
  Controls["precip-start-time"].String = ConvertTime(data.evt[1])
  
  if tostring(Properties["Precipitation Alert Enable"].Value) == "true" then
    Controls["precip-message"].String = "Rain Detected - ".. Controls["precip-start-time"].String
  end

  if not precipLockout:IsRunning() then
    Timer.CallAfter(function() Controls["precip-start-event"].Boolean = true end, 0.2)
    precipLockout:Start(300)
  end
end

parsingFunctions.evt_strike = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls["lightning-strike-time"].String = ConvertTime(data.evt[1])
  Controls["lightning-strike-distance"].String = Controls.Unit.Boolean and KmToMi(data.evt[2]).." mi" or data.evt[2].." km"
  Controls["lightning-strike-energy"].String = data.evt[3]

  if tostring(Properties["Lightning Alert Enable"].Value) == "true" then 
    Controls["lightning-message"].String = "Lightning Detected - " .. Controls["lightning-strike-distance"].String .. " - ".. Controls["lightning-strike-energy"].String .. " - " .. Controls["lightning-strike-time"].String
  end

  if not lxLockout:IsRunning() then
    Timer.CallAfter(function() Controls["lightning-start-event"].Boolean = true end, .2)
    lxLockout:Start(300)
  elseif tonumber(data.evt[2]) < 0.8 then
    Timer.CallAfter(function() Controls["lightning-start-event"].Boolean = true end, .2)
  end
end

parsingFunctions.rapid_wind = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls["wind-start-event"].Boolean = true
  Controls["wind-time"].String = ConvertTime(data.ob[1])
  if Controls.Unit.Boolean then
    Controls["wind-speed"].String = MpsToMph(data.ob[2]) .. " mph"
  else
    Controls["wind-speed"].String = data.ob[2] .. " m/s"
  end
  Controls["wind-direction"].String = data.ob[3]

  if tostring(Properties["Wind Alert Enable"].Value) == "true" then
    Controls["wind-message"].String = "Wind Detected - " .. string.format("%s @ %s", Controls["wind-speed"].String, Controls["wind-direction"].String) .. " - " .. Controls["wind-time"].String
  end
end

parsingFunctions.obs_st = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls["obs-timestamp"].String = ConvertTime(data.obs[1][1])
  if Controls.Unit.Boolean then 
    Controls["obs-wind-lull"].String = MpsToMph(data.obs[1][2]) .. " mph"
    Controls["obs-wind-average"].String = MpsToMph(data.obs[1][3]) .. " mph"
    Controls["obs-wind-gust"].String = MpsToMph(data.obs[1][4]) .. " mph"
    Controls["obs-airtemp"].String = CToF(data.obs[1][8]) .. "° F"
    Controls["obs-rain-pastmin"].String = MMToIn(data.obs[1][13]) .. '"'
    Controls["obs-lightning-avg-dist"].String = KmToMi(data.obs[1][15]) .. " mi"
  else
    Controls["obs-wind-lull"].String = data.obs[1][2] .. " m/s"
    Controls["obs-wind-average"].String = data.obs[1][3] .. " m/s"
    Controls["obs-wind-gust"].String = data.obs[1][4] .. " m/s"
    Controls["obs-airtemp"].String = data.obs[1][8] .. "° C"
    Controls["obs-rain-pastmin"].String = data.obs[1][13] .. "mm"
    Controls["obs-lightning-avg-dist"].String = data.obs[1][15] .. " km"
  end

  Controls["obs-wind-direction"].String = data.obs[1][5] .. "°"
  Controls["obs-wind-interval"].String = data.obs[1][6]
  Controls["obs-pressure"].String = data.obs[1][7] .. " MB"
  Controls["obs-humidity"].String = data.obs[1][9] .. "%"
  Controls["obs-illuminance"].String = data.obs[1][10]  .. " Lux"
  Controls["obs-uv"].String = data.obs[1][11] .. " W/m^2"
  Controls["obs-solar-radiation"].String = data.obs[1][12]
  Controls["obs-precip-type"].String = data.obs[1][14]
  Controls["obs-lightning-strike-count"].String = data.obs[1][16]
  Controls["obs-battery"].String = data.obs[1][17]
  Controls["obs-reporting-interval"].String = data.obs[1][18]

  if Properties["Connection Method"].Value == "WebSocket" then
    Controls["sum-pressure-trend"].String = data.summary.pressure_trend or "N/A"
    if Controls.Unit.Boolean then 
      Controls["sum-feels-like"].String = CToF(data.summary.feels_like) .. "° F"
      Controls["sum-heat-index"].String = CToF(data.summary.heat_index) .. "° F"
      Controls["sum-wind-chill"].String = CToF(data.summary.wind_chill) .. "° F"
      Controls["sum-dew-point"].String = CToF(data.summary.dew_point) .. "° F"
      Controls["sum-wet-bulb-temp"].String = CToF(data.summary.wet_bulb_temperature) .. "° F"
      Controls["sum-wet-bulb-globe-temp"].String = CToF(data.summary.wet_bulb_globe_temperature) .. "° F"
      Controls["sum-delta-t"].String = CToF(data.summary.delta_t)  .. "° F"
      Controls["sum-precip-last-1h"].String = MMToIn(data.summary.precip_total_1h) .. " in"
      Controls["sum-precip-accum-yesterday"].String = MMToIn(data.summary.precip_accum_local_yesterday) .. " in"
      Controls["sum-precip-accum-yesterday-final"].String = MMToIn(data.summary.precip_accum_local_yesterday_final) .. " in"
      Controls["sum-lightning-last-dist"].String = KmToMi(data.summary.strike_last_dist) .. " mi"
      Controls["sum-air-density"].String = KgToLb(data.summary.air_density) .. "lb/ft3"
    else 
      Controls["sum-feels-like"].String = data.summary.feels_like .. "° C"
      Controls["sum-heat-index"].String = data.summary.heat_index .. "° C"
      Controls["sum-wind-chill"].String = data.summary.wind_chill .. "° C"
      Controls["sum-dew-point"].String = data.summary.dew_point .. "° C"
      Controls["sum-wet-bulb-temp"].String = data.summary.wet_bulb_temperature .. "° C"
      Controls["sum-wet-bulb-globe-temp"].String = data.summary.wet_bulb_globe_temperature .. "° C"
      Controls["sum-delta-t"].String = data.summary.delta_t  .. "° C"
      Controls["sum-precip-last-1h"].String = data.summary.precip_total_1h .. " mm"
      Controls["sum-precip-accum-yesterday"].String = data.summary.precip_accum_local_yesterday .. " mm"
      Controls["sum-precip-accum-yesterday-final"].String = data.summary.precip_accum_local_yesterday_final .. " mm"
      Controls["sum-lightning-last-dist"].String = data.summary.strike_last_dist .. " km"
      Controls["sum-air-density"].String = data.summary.air_density .. "kg/m3"
    end
    Controls["sum-lightning-last-1h"].String = data.summary.strike_count_1h
    Controls["sum-lightning-last-3h"].String = data.summary.strike_count_3h
    Controls["sum-lightning-last-time"].String = ConvertTime(data.summary.strike_last_epoch)
  end
end 

parsingFunctions.device_status = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls.Connected.Boolean = data.serial_number or false
  Controls["status-device-sn"].String = data.serial_number or "N/A"
  Controls["status-device-hub-sn"].String = data.hub_sn or "N/A"
  Controls["status-device-time"].String = ConvertTime(data.timestamp) or "N/A"
  Controls["status-device-uptime"].String = data.uptime or "N/A"
  Controls["status-device-voltage"].String = data.voltage or "N/A"
  Controls["status-device-firmware"].String = data.firmware_revision or "N/A"
  Controls["status-device-rssi"].String = data.rssi or "N/A"
  Controls["status-device-hub-rssi"].String = data.hub_rssi or "N/A"
  Controls["status-device-sensor-status"].String = decodeSensorState(data.sensor_status) or "N/A"
end

parsingFunctions.hub_status = function(data)
  PrintToDebug("function", rapidjson.encode(data))
  Controls["status-hub-sn"].String = data.serial_number or "N/A"
  Controls["status-hub-firmware"].String = data.firmware_revision or "N/A"
  Controls["status-hub-uptime"].String = data.uptime or "N/A"
  Controls["status-hub-rssi"].String = data.rssi or "N/A"
  Controls["status-hub-time"].String = ConvertTime(data.timestamp) or "N/A"
  Controls["status-hub-reset-flag"].String = data.reset_flags or "N/A"
  Controls["status-hub-seq"].String = data.seq or "N/A"
  Controls["status-hub-fs"].String = rapidjson.encode(data.fs) or "N/A"
  Controls["status-hub-radio"].String = rapidjson.encode(data.radio_stats) or "N/A"
  Controls["status-hub-freq"].String = data.freq or "N/A"
  Controls["status-hub-hw-ver"].String = data.hw_version or "N/A"
  Controls["status-hub-hardware-id"].String = data.hardware_id or "N/A"
end

function ParseData(data)
  local temp = rapidjson.decode(data)
  PrintToDebug("function", temp["type"])
  if parsingFunctions[temp["type"]] ~= nil then 
    parsingFunctions[temp["type"]](temp)
    -- parsingFunctions.device_status(temp)
    -- parsingFunctions.hub_status(temp)
  else
    PrintToDebug("function", "Unknown Event - ".. temp["type"])
  end
end 

-- Event Handlers

Controls["Connect"].EventHandler = function(ctrl)
  if ctrl.Boolean then
    Connect()
  else
    if Controls["Connected"].Boolean then
      Disconnect()
    end
  end
end

Controls["Get Forecast"].EventHandler = function(ctrl)
  if ctrl.Boolean then
    Write("start")
  else
    Write("stop")
  end
end

Controls["Get Rapid Wind Reports"].EventHandler = function(ctrl)
  if ctrl.Boolean then
    Write("rapidStart")
  else
    Write("rapidStop")
  end
end
