local Library = {}

function Library:CreateWindow(hubName)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = hubName

    local MainFrame = Instance.new("Frame", sg)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Size = UDim2.new(0, 300, 0, 250)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
    MainFrame.Active = true
    MainFrame.Draggable = true

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = hubName
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

    local Container = Instance.new("ScrollingFrame", MainFrame)
    Container.Size = UDim2.new(1, -10, 1, -40)
    Container.Position = UDim2.new(0, 5, 0, 35)
    Container.BackgroundTransparency = 1
    
    Instance.new("UIListLayout", Container).Padding = UDim.new(0, 5)

    local Elements = {}

    -- Chức năng Toggle (Nút gạt Bật/Tắt)
    function Elements:CreateToggle(text, callback)
        local On = false
        local ToggleBtn = Instance.new("TextButton", Container)
        ToggleBtn.Size = UDim2.new(1, 0, 0, 35)
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ToggleBtn.Text = text .. " : OFF"
        ToggleBtn.TextColor3 = Color3.new(1, 0, 0) -- Màu đỏ khi OFF

        ToggleBtn.MouseButton1Click:Connect(function()
            On = not On
            if On then
                ToggleBtn.Text = text .. " : ON"
                ToggleBtn.TextColor3 = Color3.new(0, 1, 0) -- Màu xanh khi ON
            else
                ToggleBtn.Text = text .. " : OFF"
                ToggleBtn.TextColor3 = Color3.new(1, 0, 0)
            end
            callback(On)
        end)
    end

    return Elements
end

return Library
