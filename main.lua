local MyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()
local TabMain = MyLib:CreateWindow("KAERU MAIN")

-- Chức năng Auto Farm Level
TabMain:CreateToggle("Auto Farm Level", function(state)
    _G.AutoFarm = state
    
    if _G.AutoFarm then
        -- Vòng lặp chạy khi bật Toggle
        spawn(function()
            while _G.AutoFarm do
                task.wait(0.1)
                -- Chèn code tấn công quái tại đây
                print("Đang Farm Level...")
            end
        end)
    else
        print("Đã dừng Farm.")
    end
end)

-- Chức năng Auto Stats (Ví dụ thêm)
TabMain:CreateToggle("Auto Stats Melee", function(state)
    _G.AutoStats = state
    print("Trạng thái nâng điểm: " .. tostring(state))
end)
