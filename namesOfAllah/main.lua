wx = require("wx")
require "cjson"
dofile("app.lua")
frame = wx.wxFrame(wx.NULL, wx.wxID_ANY, name .. " version: " .. tostring(version))
panel = wx.wxPanel(frame, -1)
sizer=wx.wxBoxSizer(wx.wxVERTICAL)
names=wx.wxListBox(panel,-1)
file=io.open("data/namesOfAllah.json","r")
data=cjson.decode(file:read("*all"))
file:close()
for allahName in ipairs(data.names) do
    names:Append(allahName.name .. " : " .. allahName.meaning)
end
panel:setSizer(sizer)
frame:Show(true)

wx.wxGetApp():MainLoop()
