local Library = {}

function Library:CreateWindow(hubName)
    -- 1. Tạo ScreenGui (Lớp nền hiển thị trên màn hình)
    local sg = Instance.new("ScreenGui")
    sg.Name = hubName
    sg.Parent = game.CoreGui
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- 2. Tạo Khung Chính (Main Frame)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = sg
    MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Màu nền tối
    MainFrame.BorderSizePixel = 0
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.Active = true
    MainFrame.Draggable = true -- Cho phép kéo menu di chuyển

    -- 3. Tiêu đề (Title)
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = MainFrame
    Title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = hubName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 14

    -- 4. Khu vực chứa các nút (Container)
    local Container = Instance.new("ScrollingFrame")
    Container.Name = "Container"
    Container.Parent = MainFrame
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0, 5, 0, 35)
    Container.Size = UDim2.new(1, -10, 1, -40)
    Container.CanvasSize = UDim2.new(0, 0, 2, 0)
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)

    -- Hàm tạo Nút Bấm (AddButton)
    local Elements = {}
    function Elements:CreateButton(btnText, callback)
        local Button = Instance.new("TextButton")
        Button.Name = btnText
        Button.Parent = Container
        Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        Button.Size = UDim2.new(1, 0, 0, 30)
        Button.Font = Enum.Font.Gotham
        Button.Text = btnText
        Button.TextColor3 = Color3.fromRGB(255, 255, 255)
        Button.TextSize = 14
        
        -- Bo góc nút
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 6)
        UICorner.Parent = Button

        -- Hiệu ứng khi bấm
        Button.MouseButton1Click:Connect(function()
            callback()
            -- Hiệu ứng nháy màu khi bấm
            Button.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
            wait(0.1)
            Button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end)
    end

    return Elements
end

return Library
