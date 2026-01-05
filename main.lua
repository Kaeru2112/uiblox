local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Blox Fruits Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Tạo một Tab mới
local MainTab = Window:MakeTab({
    Name = "Trang chính",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Tạo một Nút (Button)
MainTab:AddButton({
    Name = "Auto Farm (Ví dụ)",
    Callback = function()
              print("Đã kích hoạt Auto Farm!")
      end    
})

OrionLib:Init()
