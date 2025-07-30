local CurrentPage = PageNames[props["page_index"].Value]
if CurrentPage == "Configuration" then
  -- BG
  if props["Connection Method"].Value == "WebSocket" then
  table.insert(graphics, {
    Type = "GroupBox",
    Position = {0,0},
    Size = {400,450},
    Fill = {255,255,255},
    StrokeWidth = 0,
    CornerRadius = 0
  })
  else
    table.insert(graphics, {
    Type = "GroupBox",
    Position = {0,0},
    Size = {400,240},
    Fill = {255,255,255},
    StrokeWidth = 0,
    CornerRadius = 0
  })
  end
  -- Title Block
  table.insert(graphics, {
    Type = "Label",
    Position = {0,0},
    Size = {400,40},
    Fill = {51,33,55},
    StrokeWidth = 0,
    Text = "WeatherFlow Tempest",
    Color = {255,255,255},
    FontSize = 16,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })
  -- Congiguration Section
  table.insert(graphics, {
    Type = "GroupBox",
    Position = {13,50},
    Size = {375,170},
    Fill = {0,0,0,0.0},
    StrokeWidth = 3,
    StrokeColor = {51,33,55},
    CornerRadius = 8
  })
  table.insert(graphics, {
    Type = "Label",
    Position = {13,50},
    Size = {375,25},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Configuration",
    Color = {51,33,55},
    FontSize = 10,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Position = {32,81},
    Size = {94,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Status",
    Color = {51,51,51},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["Status"] = {
    PrettyName = "Status",
    Position = {126,81},
    Size = {244,16},
  }
  if props["Connection Method"].Value == "WebSocket" then
    table.insert(graphics, {
      Type = "Label",
      Position = {32,107},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Access Token",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {32,133},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Device ID",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
  end
  table.insert(graphics, {
    Type = "Label",
    Position = {32,159},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Connect to Station",
    Color = {51,51,51},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Left",
    VTextAlign = "Center"
  })
  table.insert(graphics, {
    Type = "Label",
    Position = {194,159},
    Size = {138,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Connection Status",
    Color = {51,51,51},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  if props["Connection Method"].Value == "WebSocket" then
    table.insert(graphics, {
      Type = "Label",
      Position = {32,185},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Get Weather Data",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Left",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {194,185},
      Size = {138,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Get Rapid Wind Reports",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
  end
  if props["Connection Method"].Value == "WebSocket" then
    -- Configuration Controls
    layout["Access-Token"] = {
      Type = "Text",
      Position = {126,107},
      Size = {244,16},
      Fill = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    layout["Device-ID"] = {
      Type = "Text",
      Position = {126,133},
      Size = {244,16},
      Fill = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
  end
  layout["Connect"] = {
    Type = "Button",
    Position = {158,159},
    Size = {36,16},
    StrokeWidth = 1
  }
  layout["Connected"] = {
    Type = "Led",
    Position = {352,159},
    Size = {16,16},
    StrokeWidth = 1,
    Margin = 3,
    Color = {255,0,0}
  }
  if props["Connection Method"].Value == "WebSocket" then
    layout["Get Forecast"] = {
      Type = "Button",
      Position = {158,185},
      Size = {36,16},
      StrokeWidth = 1
    }
    layout["Get Rapid Wind Reports"] = {
      Type = "Button",
      Position = {332,185},
      Size = {36,16},
      StrokeWidth = 1
    }
  end

-- Instruction Section
  if props["Connection Method"].Value == "WebSocket" then
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,230},
      Size = {375,200},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })

    table.insert(graphics, {
      Type = "Label",
      Position = {13,230},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Instructions",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "Bold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })

    table.insert(graphics, {
      Type = "Label",
      Position = {18,253},
      Size = {365,177},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Margin = 5,
      Padding = 5,
      Text = 'To connect using the Websocket API, you need to generate an access token. To generate a token, first, head to Tempestwx.com. Then, go to Settings -> Data Authorizations -> Create Token. Next, copy and past the token into the app. To obtain the Device ID, head to Settings -> Stations -> <Your Station> -> Status, and you will see the Device ID. Enter this data into the above Configuration fields. Then, select "Connect to Station". Once the station is connected, select which style of data you would like to receive.',
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Left",
      VTextAlign = "Center",
    })
  end

elseif CurrentPage == "Weather Data" then
    -- BG
  if props["Connection Method"].Value == "WebSocket" then
    table.insert(graphics, {
    Type = "GroupBox",
    Position = {0,0},
    Size = {400,899},
    Fill = {255,255,255},
    StrokeWidth = 0,
    CornerRadius = 0
    })
  else
    table.insert(graphics, {
    Type = "GroupBox",
    Position = {0,0},
    Size = {400,689},
    Fill = {255,255,255},
    StrokeWidth = 0,
    CornerRadius = 0
    })
  end

  -- Title Block
  table.insert(graphics, {
    Type = "Label",
    Position = {0,0},
    Size = {400,40},
    Fill = {51,33,55},
    StrokeWidth = 0,
    Text = "WeatherFlow Tempest",
    Color = {255,255,255},
    FontSize = 16,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })
  -- Weather Data Section

  
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,50},
      Size = {375,325},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {13,50},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Observations",
      Color = {0,0,0},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "Bold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {35,85},
      Size = {155,75},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8 
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,85},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Current Conditions",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,101},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Air Temperature",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-airtemp"] = {
      Type = "Text",
      PrettyName = "Observations~Air Temperature",
      Position = {130,101},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,117},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Humidity",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-humidity"] = {
      Type = "Text",
      PrettyName = "Observations~Humidity",
      Position = {130,117},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,133},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Pressure",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-pressure"] = {
      Type = "Text",
      PrettyName = "Observations~Pressure",
      Position = {130,133},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {209,85},
      Size = {155,75},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    -- Sunlight Section
    table.insert(graphics, {
      Type = "Label",
      Position = {209,85},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Sunlight",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,101},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "illuminance",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-illuminance"] = {
      Type = "Text",
      PrettyName = "Observations~Illuminance",
      Position = {304,101},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,117},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "UV Index",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-uv"] = {
      Type = "Text",
      PrettyName = "Observations~UV Index",
      Position = {304,117},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,133},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Solar Radiation",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-solar-radiation"] = {
      Type = "Text",
      PrettyName = "Observations~Solar Radiation",
      Position = {304,133},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Wind Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {35,168},
      Size = {155,105},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,168},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,184},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Lull",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-wind-lull"] = {
      Type = "Text",
      PrettyName = "Observations~Wind Lull",
      Position = {130,184},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,200},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Average",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-wind-average"] = {
      Type = "Text",
      PrettyName = "Observations~Wind Average",
      Position = {130,200},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,216},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Gust",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-wind-gust"] = {
      Type = "Text",
      PrettyName = "Observations~Wind Gust",
      Position = {130,216},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,232},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Direction",  
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",   
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-wind-direction"] = {
      Type = "Text",
      PrettyName = "Observations~Wind Direction",
      Position = {130,232},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,248},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Interval",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-wind-interval"] = {
      Type = "Text",
      PrettyName = "Observations~Wind Interval",
      Position = {130,248},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Precipitation Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {209,168},
      Size = {155,75},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,168},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precipitation",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,184},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Rain (Past Min.)",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-rain-pastmin"] = {
      Type = "Text",
      PrettyName = "Observations~Rain (Past Min.)",
      Position = {304,184},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,200},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precip. Type",  
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-precip-type"] = {
      Type = "Text",
      PrettyName = "Observations~Precipitation Type",
      Position = {304,200},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Sensor Information Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {35,280},
      Size = {155,55},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,280},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Sensor Info",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,296},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Battery Voltage",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-battery"] = {
      Type = "Text",
      PrettyName = "Observations~Battery Voltage",
      Position = {130,296},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,312},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Update Interval",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-reporting-interval"] = {
      Type = "Text",
      PrettyName = "Observations~Update Interval",
      Position = {130,312},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Misc. Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {209,248},
      Size = {155,75},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,248},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Unit of Measurement",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })

    layout["Unit"] = {
      Type = "Button",
      Position = {247,277},
      Size = {80,32},
      StrokeWidth = 1,
      CornerRadius = 2,
      Margin = 2,
      PrettyName = "Unit",
      Legend = "Metric",
      UnlinkOffColor = true,
      Color = {226,50,50},
      OffColor = {0,140,210},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }

    -- Observations Footer
    
    table.insert(graphics, {
      Type = "Label",
      Position = {98,345},
      Size = {103,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Updated",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Bold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })

    layout["obs-timestamp"] = {
      Type = "Text",
      PrettyName = "Observations~Timestamp",
      Position = {201,345},
      Size = {105,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }

    -- Precipitation Event Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,385},
      Size = {375,65},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {13,385},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precipitation Event",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    layout["precip-start-event"] = {
      Type = "Led",
      PrettyName = "Precipitation~Start Event",
      Position = {132,389},
      Size = {16,16},
      StrokeWidth = 1,
      Margin = 3,
      Color = {255,0,0}
     }
     table.insert(graphics, {
      Type = "Label",
      Position = {37,410},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precipitation Start Time",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Light",
      HTextAlign = "Right",
      VTextAlign = "Center"
     })
     layout["precip-start-time"] = {
      Type = "Text",
      PrettyName = "Precipitation~Start Time",
      Position = {165,410},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
     }
     if props["Precipitation Alert Enable"].Value == true then
      table.insert(graphics, {
      Type = "Label",
      Position = {37,426},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precipitation Alert",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Light",
      HTextAlign = "Right",
      VTextAlign = "Center"
      })
      layout["precip-message"] = {
        Type = "Text",
        PrettyName = "Precipitation~Message",
        Position = {165,426},
        Size = {200,16},
        Color = {255,255,255,0.0},
        TextBoxStyle = "Normal",
        StrokeWidth = 1,
        StrokeColor = {51,33,55},
        FontSize = 9,
        Font = "Poppins",
        FontStyle = "Regular",
        HTextAlign = "Center",
        VTextAlign = "Center"
      }
    end
     -- Lightning Event Section
     table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,455},
      Size = {375,125},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {13,455},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Lightning Event",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    layout["lightning-start-event"] = {
      Type = "Led",
      PrettyName = "Lightning~Start Event",
      Position = {132,459},
      Size = {16,16},
      StrokeWidth = 1,
      Margin = 3,
      Color = {255,0,0}
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,480},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Strike Time",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["lightning-strike-time"] = {
      Type = "Text",
      PrettyName = "Lightning~Last Strike Time",
      Position = {165,480},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,496},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Strike Distance",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["lightning-strike-distance"] = {
      Type = "Text",
      PrettyName = "Lightning~Strike Distance",
      Position = {165,496},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,512},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Strike Energy",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["lightning-strike-energy"] = {
      Type = "Text",
      PrettyName = "Lightning~Strike Energy",
      Position = {165,512},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,528},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Average Distance",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-lightning-avg-dist"] = {
      Type = "Text",
      PrettyName = "Observations~Lightning Average Distance",
      Position = {165,528},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,544},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Strike Count",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["obs-lightning-strike-count"] = {
      Type = "Text",
      PrettyName = "Observations~Lightning Strike Count",
      Position = {165,544},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    if props["Lightning Alert Enable"].Value == true then
      table.insert(graphics, {
      Type = "Label",
      Position = {37,560},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Lightning Alert",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["lightning-message"] = {
      Type = "Text",
      PrettyName = "Lightning~Message",
      Position = {165,560},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    end
    -- Wind Event Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,585},
      Size = {375,100},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {13,585},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Event",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    layout["wind-start-event"] = {
      Type = "Led",
      PrettyName = "Wind~Start Event",
      Position = {132,589},
      Size = {16,16},
      StrokeWidth = 1,
      Margin = 3,
      Color = {255,0,0}
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,610},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Wind Time",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["wind-time"] = {
      Type = "Text",
      PrettyName = "Wind~Last Wind Time",
      Position = {165,610},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,626},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Speed",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["wind-speed"] = {
      Type = "Text",
      PrettyName = "Wind~Speed",
      Position = {165,626},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {37,642},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Direction",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["wind-direction"] = {
      Type = "Text",
      PrettyName = "Wind~Direction",
      Position = {165,642},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    if props["Wind Alert Enable"].Value == true then
      table.insert(graphics, {
      Type = "Label",
      Position = {37,658},
      Size = {128,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Alert",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["wind-message"] = {
      Type = "Text",
      PrettyName = "Wind~Message",
      Position = {165,658},
      Size = {200,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    end
  -- Summary Section
  if props["Connection Method"].Value == "WebSocket" then
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {13,696},
      Size = {375,200},
      Fill = {0,0,0,0.0},
      StrokeWidth = 3,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {13,696},
      Size = {375,25},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Summary",
      Color = {51,33,55},
      FontSize = 10,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {36,716},
      Size = {155,175},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {36,716},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Conditions",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {35,732},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Pressure Trend",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center" 
    })
    layout["sum-pressure-trend"] = {
      Type = "Text",
      PrettyName = "Summary~Pressure Trend",
      Position = {130,732},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,748},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Feels Like",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-feels-like"] = {
      Type = "Text",
      PrettyName = "Summary~Feels Like",
      Position = {130,748},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,764},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Heat Index",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-heat-index"] = {
      Type = "Text",
      PrettyName = "Summary~Heat Index",
      Position = {130,764},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,780},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wind Chill",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-wind-chill"] = {
      Type = "Text",
      PrettyName = "Summary~Wind Chill",
      Position = {130,780},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,796},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Dew Point",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-dew-point"] = {
      Type = "Text",
      PrettyName = "Summary~Dew Point",
      Position = {130,796},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,812},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wet Bulb Temp.",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-wet-bulb-temp"] = {
      Type = "Text",
      PrettyName = "Summary~Wet Bulb Temperature",
      Position = {130,812},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,828},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Wet Bulb Globe",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-wet-bulb-globe-temp"] = {
      Type = "Text",
      PrettyName = "Summary~Wet Bulb Globe Temperature",
      Position = {130,828},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,844},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Air Density",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-air-density"] = {
      Type = "Text",
      PrettyName = "Summary~Air Density",
      Position = {130,844},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {35,860},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Temperature Delta",
      Color = {51,51,51},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-delta-t"] = {
      Type = "Text",
      PrettyName = "Summary~Temperature Delta",
      Position = {130,860},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Precipitation Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {209,716},
      Size = {155,72},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,716},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Precipitation",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,732},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Hour Accum.",
      Color = {51,51,51},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-precip-last-1h"] = {
      Type = "Text",
      PrettyName = "Summary~Precipitation Last Hour Accumulation",
      Position = {304,732},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,748},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Yest. Accum.",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-precip-accum-yesterday"] = {
      Type = "Text",
      PrettyName = "Summary~Precipitation Yesterday Accumulation",
      Position = {304,748},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,764},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Yest. Accum. Final",
      Color = {51,51,51},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-precip-accum-yesterday-final"] = {
      Type = "Text",
      PrettyName = "Summary~Precipitation Yesterday Final Accumulation",
      Position = {304,764},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    -- Lightning Section
    table.insert(graphics, {
      Type = "GroupBox",
      Position = {209,796},
      Size = {155,85},
      Fill = {0,0,0,0.0},
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      CornerRadius = 8
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,796},
      Size = {155,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Lightning",
      Color = {51,33,55},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "SemiBold",
      HTextAlign = "Center",
      VTextAlign = "Center"
    })
    table.insert(graphics, {
      Type = "Label",
      Position = {209,812},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last 1h Strikes",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-lightning-last-1h"] = {
      Type = "Text",
      PrettyName = "Summary~Lightning Last 1 Hour Strikes",
      Position = {304,812},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,828},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last 3h Strikes",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-lightning-last-3h"] = {
      Type = "Text",
      PrettyName = "Summary~Lightning Last 3 Hour Strikes",
      Position = {304,828},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,844},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Strike Dist.",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-lightning-last-dist"] = {
      Type = "Text",
      PrettyName = "Summary~Lightning Last Strike Distance",
      Position = {304,844},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
    table.insert(graphics, {
      Type = "Label",
      Position = {209,860},
      Size = {94,16},
      Fill = {0,0,0,0.0},
      StrokeWidth = 0,
      Text = "Last Strike Time",
      Color = {51,51,51},
      FontSize = 11,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Right",
      VTextAlign = "Center"
    })
    layout["sum-lightning-last-time"] = {
      Type = "Text",
      PrettyName = "Summary~Lightning Last Strike Time",
      Position = {304,860},
      Size = {60,16},
      Color = {255,255,255, 0.0},
      TextBoxStyle = "Normal",
      StrokeWidth = 1,
      StrokeColor = {51,33,55},
      FontSize = 9,
      Font = "Poppins",
      FontStyle = "Regular",
      HTextAlign = "Center",
      VTextAlign = "Center"
    }
  end
elseif CurrentPage == "Status" then
  -- BG
  table.insert(graphics, {
    Type = "GroupBox",
    Position = {0,0},
    Size = {400,495},
    Fill = {255,255,255},
    StrokeWidth = 0,
    CornerRadius = 0
  })
    -- Title Block
  table.insert(graphics, {
    Type = "Label",
    Position = {0,0},
    Size = {400,40},
    Fill = {51,33,55},
    StrokeWidth = 0,
    Text = "WeatherFlow Tempest",
    Color = {255,255,255},
    FontSize = 16,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })

  -- Status Section

  table.insert(graphics, {
    Type = "GroupBox",
    Position = {13,50},
    Size = {375,195},
    Fill = {0,0,0,0.0},
    StrokeWidth = 3,
    StrokeColor = {51,33,55},
    CornerRadius = 8
  })

  table.insert(graphics, {
    Type = "Label",
    Position = {13,50},
    Size = {375,25},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Sensor Status",
    Color = {0,0,0},
    FontSize = 10,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })

  table.insert(graphics, {
    Type = "Label",
    Position = {37,70},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Serial Number",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-sn"] = {
    Type = "Text",
    PrettyName = "Status~Serial Number",
    Position = {165,70},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,86},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Paired Hub",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-hub-sn"] = {
    Type = "Text",
    PrettyName = "Status~Paired Hub",
    Position = {165,86},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,102},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Uptime",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-uptime"] = {
    Type = "Text",
    PrettyName = "Status~Uptime",
    Position = {165,102},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,118},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Voltage",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-voltage"] = {
    Type = "Text",
    PrettyName = "Status~Voltage",
    Position = {165,118},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,134},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Firmware",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-firmware"] = {
    Type = "Text",
    PrettyName = "Status~Firmware",
    Position = {165,134},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,150},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Station Wifi Signal Strength",
    Color = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-rssi"] = {
    Type = "Text",
    PrettyName = "Status~Station Wifi Signal Strength",
    Position = {165,150},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,166},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Wifi Signal Strength",
    Color = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-hub-rssi"] = {
    Type = "Text",
    PrettyName = "Status~Hub Wifi Signal Strength",
    Position = {165,166},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,182},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Sensor Status",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-sensor-status"] = {
    Type = "Text",
    PrettyName = "Status~Sensor Status",
    Position = {165,182},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,210},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Last Updated",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-device-time"] = {
    Type = "Text",
    PrettyName = "Status~Last Updated",
    Position = {165,210},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }

  table.insert(graphics, {
    Type = "GroupBox",
    Position = {13,255},
    Size = {375,240},
    Fill = {0,0,0,0.0},
    StrokeWidth = 3,
    StrokeColor = {51,33,55},
    CornerRadius = 8
  })

  table.insert(graphics, {
    Type = "Label",
    Position = {13,255},
    Size = {375,25},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Status",
    Color = {0,0,0},
    FontSize = 10,
    Font = "Poppins",
    FontStyle = "Bold",
    HTextAlign = "Center",
    VTextAlign = "Center"
  })

  table.insert(graphics, {
    Type = "Label",
    Position = {37,275},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Serial Number",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-sn"] = {
    Type = "Text",
    PrettyName = "Status~Hub Serial Number",
    Position = {165,275},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,291},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Firmware",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-firmware"] = {
    Type = "Text",
    PrettyName = "Status~Hub Firmware",
    Position = {165,291},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal", 
    StrokeWidth = 1,
    StrokeColor = {51,33,55}, 
    FontSize = 9,
    Font = "Poppins", 
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,307},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Uptime",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-uptime"] = {
    Type = "Text",
    PrettyName = "Status~Hub Uptime",
    Position = {165,307},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,323},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Wifi Signal Strength",
    Color = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-rssi"] = {
    Type = "Text",
    PrettyName = "Status~Hub Wifi Signal Strength",
    Position = {165,323},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,339},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Reset Flags",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-reset-flag"] = {
    Type = "Text",
    PrettyName = "Status~Hub Reset Flags",
    Position = {165,339},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,355},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Seq",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-seq"] = {
    Type = "Text",
    PrettyName = "Status~Hub Seq",
    Position = {165,355},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,371},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub fs",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-fs"] = {
    Type = "Text",
    PrettyName = "Status~Hub fs",
    Position = {165,371},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,387},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Radio Info",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center" 
  })
  layout["status-hub-radio"] = {
    Type = "Text",
    PrettyName = "Status~Radio Info",
    Position = {165,387},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,403},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub Frequency",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-freq"] = {
    Type = "Text",
    PrettyName = "Status~Hub Frequency",
    Position = {165,403},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,419},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub HW Version",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-hw-ver"] = {
    Type = "Text",
    PrettyName = "Status~Hub HW Version",
    Position = {165,419},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,435},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Hub HW ID",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins", 
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-hardware-id"] = {
    Type = "Text",
    PrettyName = "Status~Hub HW ID",
    Position = {165,435},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
  table.insert(graphics, {
    Type = "Label",
    Position = {37,462},
    Size = {128,16},
    Fill = {0,0,0,0.0},
    StrokeWidth = 0,
    Text = "Last Updated",
    Color = {51,33,55},
    FontSize = 11,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Right",
    VTextAlign = "Center"
  })
  layout["status-hub-time"] = {
    Type = "Text",
    PrettyName = "Status~Hub Last Updated",
    Position = {165,462},
    Size = {200,16},
    Color = {255,255,255, 0.0},
    TextBoxStyle = "Normal",  
    StrokeWidth = 1,
    StrokeColor = {51,33,55},
    FontSize = 9,
    Font = "Poppins",
    FontStyle = "Regular",
    HTextAlign = "Center",
    VTextAlign = "Center"
  }
end