local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kaeru Hub", HidePremium = false, SaveConfig = true})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Test UI",
    Callback = function()
              OrionLib:MakeNotification({Name = "Thành công!", Content = "UI của bạn đã hoạt động", Image = "rbxassetid://4483345998", Time = 5})
      end    
})

OrionLib:Init()
