local MyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()
local Main = MyLib:CreateWindow("KAERU PREMIUM V2")

Main:CreateToggle("Auto Farm Level", function(state)
    _G.AutoFarm = state
    if state then
        spawn(function()
            while _G.AutoFarm do
                task.wait(1)
                print("Đang săn quái...")
            end
        end)
    end
end)

Main:CreateToggle("Auto Stats", function(state)
    print("Auto Stats: " .. tostring(state))
end)
