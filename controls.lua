-- Status Control
table.insert(ctrls, {
  Name = "Status",
  ControlType = "Indicator",
  IndicatorType = "Status",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})
-- Unique Controls
table.insert(ctrls, {
  Name = "Access-Token",
  ControlType = "Text",
  DefaultValue = "",
  UserPin = false,
  PinStyle = "None",
  Count = 1
})
table.insert(ctrls, {
  Name = "Device-ID",
  ControlType = "Text",
  DefaultValue = "",
  UserPin = false,
  PinStyle = "None",
  Count = 1
})
table.insert(ctrls, {
  Name = "Connect",
  ControlType = "Button",
  ButtonType = "Toggle",
  ButtonVisualStyle = "Gloss",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  CornerRadius = 2,
  Margin = 2
})
table.insert(ctrls, {
  Name = "Connected",
  ControlType = "Indicator",
  IndicatorType = "Led",
  UserPin = true,
  PinStyle = "Output",
  Color = { 255,0, 0 },
  Count = 1,
})
table.insert(ctrls, {
  Name = "Get Forecast",
  ControlType = "Button",
  ButtonType = "Toggle",
  ButtonVisualStyle = "Gloss",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  CornerRadius = 2,
  Margin = 2
})
table.insert(ctrls, {
  Name = "Get Rapid Wind Reports",
  ControlType = "Button",
  ButtonType = "Toggle",
  ButtonVisualStyle = "Gloss",
  Count = 1,
  UserPin = true,
  PinStyle = "Input",
  CornerRadius = 2,
  Margin = 2
})

table.insert(ctrls, {
  Name = "Unit",
  ControlType = "Button",
  ButtonType = "Toggle",
  ButtonVisualStyle = "Gloss",
  Count = 1,
  UserPin = true,
  PinStyle = "Both",
  CornerRadius = 2,
  Margin = 2,
})


-- Observations 
local obs = {
  "timestamp",
  "wind-lull",
  "wind-average",
  "wind-gust",
  "wind-direction",
  "wind-interval",
  "pressure",
  "airtemp",
  "humidity",
  "illuminance",
  "uv",
  "solar-radiation",
  "rain-pastmin",
  "precip-type",
  "lightning-avg-dist",
  "lightning-strike-count",
  "battery",
  "reporting-interval"
}
for _, name in ipairs(obs) do
  table.insert(ctrls, {
    Name = "obs-"..name,
    ControlType = "Indicator",
    IndicatorType = "Text",
    UserPin = true,
    PinStyle = "Output",
    Count = 1
  })
end

-- Precipitation
table.insert(ctrls, {
  Name = "precip-start-event",
  ControlType = "Indicator",
  IndicatorType = "Led",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})

table.insert(ctrls, {
  Name = "precip-start-time",
  ControlType = "Indicator",
  IndicatorType = "Text",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})

table.insert(ctrls, {
  Name = "precip-message",
  ControlType = "Indicator",
  IndicatorType = "Text",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})

-- Lightning Events

table.insert(ctrls, {
  Name = "lightning-start-event",
  ControlType = "Indicator",
  IndicatorType = "Led",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})

local lightning = {
  "strike-time",
  "strike-distance",
  "strike-energy",
  "message"
}

for _, name in ipairs(lightning) do
  table.insert(ctrls, {
    Name = "lightning-"..name,
    ControlType = "Indicator",
    IndicatorType = "Text",
    UserPin = true,
    PinStyle = "Output",
    Count = 1
  })
end

-- Wind Events
table.insert(ctrls, {
  Name = "wind-start-event",
  ControlType = "Indicator",
  IndicatorType = "Led",
  UserPin = true,
  PinStyle = "Output",
  Count = 1
})

local wind = {
  "time",
  "speed",
  "direction",
  "message"
}
for _, name in ipairs(wind) do
  table.insert(ctrls, {
    Name = "wind-"..name,
    ControlType = "Indicator",
    IndicatorType = "Text",
    UserPin = true,
    PinStyle = "Output",
    Count = 1
  })
end

-- Summary Data
-- These are the summary data points that are not part of the main observation set
local sum = {
  "pressure-trend",
  "lightning-last-1h",
  "lightning-last-3h",
  "lightning-last-dist",
  "lightning-last-time",
  "precip-last-1h",
  "precip-accum-yesterday",
  "precip-accum-yesterday-final",
  "precip-analysis-yesterday",
  "precip-minutes-today",
  "precip-minutes-yesterday",
  "feels-like",
  "heat-index",
  "wind-chill",
  "dew-point",
  "wet-bulb-temp",
  "wet-bulb-globe-temp",
  "air-density",
  "delta-t"
}

for _, name in ipairs(sum) do
  table.insert(ctrls, {
    Name = "sum-"..name,
    ControlType = "Indicator",
    IndicatorType = "Text",
    UserPin = true,
    PinStyle = "Output",
    Count = 1
  })
end

-- Status Data
-- These are the status data values that are only part of the UDP protocol
local status = {
  "device-sn",
  "device-hub-sn",
  "device-time",
  "device-uptime",
  "device-voltage",
  "device-firmware",
  "device-rssi",
  "device-hub-rssi",
  "device-sensor-status",
  "hub-sn",
  "hub-firmware",
  "hub-uptime",
  "hub-rssi",
  "hub-time",
  "hub-reset-flag",
  "hub-seq",
  "hub-fs",
  "hub-radio",
  "hub-freq",
  "hub-hw-ver",
  "hub-hardware-id"
}

for _, name in ipairs(status) do
  table.insert(ctrls, {
    Name = "status-"..name,
    ControlType = "Indicator",
    IndicatorType = "Text",
    UserPin = true,
    PinStyle = "Output",
    Count = 1
  })
end