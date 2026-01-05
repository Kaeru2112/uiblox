local MyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaeru2112/uiblox/main/library.lua"))()
local Main = MyLib:CreateWindow("KAERU HUB - SEA 2")

_G.AutoFarm = false

-- 1. Hàm tự động lấy vũ khí (Melee)
function Equipping()
    pcall(function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ToolTip == "Melee" then
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
            end
        end
    end)
end

-- 2. Hàm gom quái (Bring Mob)
function BringMob(mobName)
    pcall(function()
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == mobName and v:FindFirstChild("HumanoidRootPart") then
                v.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                v.HumanoidRootPart.CanCollide = false
                v.Humanoid.WalkSpeed = 0
            end
        end
    end)
end

-- 3. Logic Farm Sea 2 (Hàm CheckQuest bạn đã có)
function CheckQuest()
    local lvl = game:GetService("Players").LocalPlayer.Data.Level.Value
    if lvl >= 700 and lvl <= 724 then
        return "RaidersQuest1", "Raider", 1, CFrame.new(-424, 73, 1836)
    elseif lvl >= 725 and lvl <= 774 then
        return "RaidersQuest2", "Mercenary", 2, CFrame.new(-424, 73, 1836)
    -- Thêm các mốc khác tương tự ở đây...
    else
        return "RaidersQuest1", "Raider", 1, CFrame.new(-424, 73, 1836)
    end
end

-- UI TOGGLE
Main:CreateToggle("Auto Farm Level", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                local questName, mobName, questID, questPos = CheckQuest()
                
                if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                    -- Đi nhận nhiệm vụ
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questPos
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", questName, questID)
                else
                    -- Đi farm
                    Equipping() -- Tự lấy vũ khí
                    BringMob(mobName) -- Gom quái
                    
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == mobName and v.Humanoid.Health > 0 then
                            repeat
                                task.wait()
                                -- Bay trên đầu quái
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                                -- Tấn công
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

-- 4. Anti-AFK (Tự động bật)
spawn(function()
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
