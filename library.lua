local Library = {}

function Library:CreateWindow(Name)
    -- Tạo ScreenGui (Lớp nền của UI)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = Name

    -- Tạo một cái khung (Frame)
    local mainFrame = Instance.new("Frame", sg)
    mainFrame.Size = UDim2.new(0, 200, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    -- Tiêu đề
    local title = Instance.new("TextLabel", mainFrame)
    title.Text = Name
    title.Size = UDim2.new(1, 0, 0, 30)
    title.TextColor3 = Color3.new(1, 1, 1)
    title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

    return mainFrame
end

return Library
