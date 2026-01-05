-- Cấu hình
local Range = 20 -- Khoảng cách để bắt đầu đánh (số càng nhỏ càng gần)
_G.AutoAttack = true -- Bật/Tắt script

-- Hàm tìm quái vật gần nhất
function GetClosestEnemy()
    local closestEnemy = nil
    local shortestDistance = Range
    
    -- Duyệt qua tất cả các NPC trong Workspace (tùy thuộc vào folder chứa quái của game)
    -- Với Blox Fruit, quái thường nằm trong folder "Enemies" hoặc trực tiếp trong Workspace
    for _, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if distance < shortestDistance then
                closestEnemy = v
                shortestDistance = distance
            end
        end
    end
    return closestEnemy
end

-- Vòng lặp chính
spawn(function()
    while _G.AutoAttack do
        wait(0.1) -- Tốc độ kiểm tra (đừng để quá thấp để tránh lag)
        pcall(function()
            local target = GetClosestEnemy()
            if target then
                -- Lấy vũ khí đang cầm trên tay
                local character = game.Players.LocalPlayer.Character
                local tool = character:FindFirstChildOfClass("Tool")
                
                if tool then
                    tool:Activate() -- Tự động vung kiếm/đấm
                end
            end
        end)
    end
end)
