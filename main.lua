-- Gọi thư viện từ link Raw của chính bạn
local MyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()

-- Tạo cửa sổ
local Screen = MyLibrary:CreateWindow("KAERU SELF-MADE UI")

-- Thêm các nút bấm
Screen:CreateButton("Bật WalkSpeed (100)", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100
end)

Screen:CreateButton("Hồi máu (Reset)", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

Screen:CreateButton("Thông báo Test", function()
    print("Nút tự chế đã hoạt động!")
end)
