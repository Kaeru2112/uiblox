local MyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()
local Main = MyLib:CreateWindow("KAERU PREMIUM SEA 2")

_G.AutoFarm = false

-- Hàm kiểm tra nhiệm vụ đầy đủ cho Sea 2
function CheckQuest()
    local lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
    
    -- Kingdom of Rose (Đảo Hồng)
    if lvl >= 700 and lvl <= 724 then
        return "RaidersQuest1", "Raider", 1, CFrame.new(-424, 73, 1836)
    elseif lvl >= 725 and lvl <= 774 then
        return "RaidersQuest2", "Mercenary", 2, CFrame.new(-424, 73, 1836)
    elseif lvl >= 775 and lvl <= 799 then
        return "SwanQuest1", "Swan Pirate", 1, CFrame.new(634, 73, 918)
        
    -- Green Bit (Đảo Thực Vật)
    elseif lvl >= 875 and lvl <= 899 then
        return "MarineQuest2", "Marine Captain", 1, CFrame.new(-2443, 73, -321)
        
    -- Graveyard (Đảo Nghĩa Địa)
    elseif lvl >= 950 and lvl <= 974 then
        return "ZombieQuest1", "Zombie", 1, CFrame.new(-5367, 39, -451)
        
    -- Snow Mountain (Núi Tuyết)
    elseif lvl >= 1000 and lvl <= 1049 then
        return "SnowMountainQuest1", "Snow Soldier", 1, CFrame.new(609, 401, -5372)
        
    -- Hot and Cold (Đảo Lửa Băng)
    elseif lvl >= 1100 and lvl <= 1124 then
        return "IceSideQuest1", "Lab Subordinate", 1, CFrame.new(-6060, 16, -4905)
        
    -- Cursed Ship (Tàu Ngầm)
    elseif lvl >= 1250 and lvl <= 1274 then
        return "ShipQuest1", "Ship Deckhand", 1, CFrame.new(1038, 125, 32911)

    -- Ice Castle (Lâu Đài Băng)
    elseif lvl >= 1350 and lvl <= 1399 then
        return "IceCastleQuest1", "Arctic Warrior", 1, CFrame.new(5661, 28, -6484)

    -- Forgotten Island (Đảo Quên Lãng)
    elseif lvl >= 1425 and lvl <= 1499 then
        return "ForgottenQuest1", "Sea Soldier", 1, CFrame.new(-3054, 235, -10142)
        
    else
        -- Nếu không thuộc các mốc trên, quay về quái mặc định Sea 2
        return "RaidersQuest1", "Raider", 1, CFrame.new(-424, 73, 1836)
    end
end

Main:CreateToggle("Bật Auto Farm Sea 2", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                local questName, mobName, questID, questPos = CheckQuest()
                if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    -- Di chuyển nhận nhiệm vụ
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questPos
                    task.wait(0.8)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questName, questID)
                else
                    -- Đi đánh quái
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == mobName and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                                game:GetService("VirtualUser"):CaptureController()
                                game:GetService("VirtualUser"):ClickButton1(Vector2.new(851, 158))
                            until not _G.AutoFarm or v.Humanoid.Health <= 0 or not v.Parent
                        end
                    end
                end
            end)
        end
    end)
end)
