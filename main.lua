-- Gọi thư viện từ link Raw của chính bạn
local MyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()

-- Tạo cửa sổ Menu
local Screen = MyLibrary:CreateWindow("KAERU HUB")

-- Biến lưu trạng thái Auto Farm (mặc định là tắt)
_G.AutoFarm = false

-- Thêm chức năng Auto Farm vào tab chính (dùng nút bấm để chuyển đổi trạng thái)
Screen:CreateButton("Auto Farm Level: OFF", function()
    -- Đảo ngược trạng thái mỗi khi bấm
    _G.AutoFarm = not _G.AutoFarm
    
    -- Cập nhật thông báo hoặc logic ở đây
    if _G.AutoFarm then
        print("Đã BẬT Auto Farm Level")
        -- Thay đổi tên hoặc thông báo nếu bạn nâng cấp thư viện sau này
    else
        print("Đã TẮT Auto Farm Level")
    end

    -- Vòng lặp Auto Farm
    spawn(function()
        while _G.AutoFarm do
            task.wait(1)
            -- Đây là nơi bạn sẽ thêm code tấn công quái thực tế của Blox Fruit
            print("Đang thực hiện gom quái và farm...")
        end
    end)
end)

-- Thêm nút kiểm tra nhân vật
Screen:CreateButton("Hồi máu (Reset)", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
