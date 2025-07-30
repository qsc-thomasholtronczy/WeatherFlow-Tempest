table.insert(props, {
  Name = "Connection Method",
  Type = "enum",
  Choices = {"UDP", "WebSocket"},
  Value = "UDP",
})
table.insert(props, {
  -- Header = "Station Alerts",
  Name = "Precipitation Alert Enable",
  Type = "boolean",
  Value = false
})
table.insert(props, {
  Name = "Lightning Alert Enable",
  Type = "boolean",
  Value = false
})
table.insert(props, {
  Name = "Wind Alert Enable",
  Type = "boolean",
  Value = false
})
table.insert(props, {
  Name = "Debug Print",
  Type = "enum",
  Choices = {"Tx/Rx", "Tx", "Rx", "Function Calls", "All"},
  Value = "All"
})