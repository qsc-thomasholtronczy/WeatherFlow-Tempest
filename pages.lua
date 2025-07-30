if props["Connection Method"].Value == "UDP" then
  PageNames = { "Configuration", "Weather Data", "Status" }  --List the pages within the plugin
else -- WebSocket
  PageNames = { "Configuration", "Weather Data" }  --List the pages within the plugin
end
for ix,name in ipairs(PageNames) do
  table.insert(pages, {name = PageNames[ix]})
end