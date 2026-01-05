local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Kaeru Hub | Blox Fruits", HidePremium = false, SaveConfig = true, ConfigFolder = "KaeruConfig"})

local Tab = Window:MakeTab({
    Name = "Chính",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Kiểm tra Script",
    Callback = function()
              OrionLib:MakeNotification({
            Name = "Thành công!",
            Content = "Giao diện đã chạy bằng link Raw của bạn",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
      end    
})

OrionLib:Init()
