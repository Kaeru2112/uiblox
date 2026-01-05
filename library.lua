local Library = {}

function Library:CreateWindow(hubName)
    local sg = Instance.new("ScreenGui", game.CoreGui)
    sg.Name = hubName

    -- Khung chính với bo góc (UICorner)
    local MainFrame = Instance.new("Frame", sg)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.Size = UDim2.new(0, 350, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
    MainFrame.BorderSizePixel = 0

    local MainCorner = Instance.new("UICorner", MainFrame)
    MainCorner.CornerRadius = UDim.new(0, 10)

    -- Thanh tiêu đề
    local TopBar = Instance.new("Frame", MainFrame)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TopBar.BorderSizePixel = 0

    local TopCorner = Instance.new("UICorner", TopBar)
    TopCorner.CornerRadius = UDim.new(0, 10)

    local Title = Instance.new("TextLabel", TopBar)
    Title.Size = UDim2.new(1, -20, 1, 0)
    Title.Position = UDim2.new(0, 10, 0, 0)
    Title.Text = hubName
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1
    Title.TextSize = 16

    -- Container chứa các Tab/Nút
    local Container = Instance.new("ScrollingFrame", MainFrame)
    Container.Size = UDim2.new(1, -20, 1, -60)
    Container.Position = UDim2.new(0, 10, 0, 50)
    Container.BackgroundTransparency = 1
    Container.ScrollBarThickness = 2
    Container.CanvasSize = UDim2.new(0, 0, 2, 0)
    
    local Layout = Instance.new("UIListLayout", Container)
    Layout.Padding = UDim.new(0, 8)

    local Elements = {}

    -- Chức năng Toggle đẹp hơn
    function Elements:CreateToggle(text, callback)
        local On = false
        local ToggleBG = Instance.new("TextButton", Container)
        ToggleBG.Size = UDim2.new(1, 0, 0, 40)
        ToggleBG.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        ToggleBG.Text = ""
        ToggleBG.AutoButtonColor = false

        local TGCorn = Instance.new("UICorner", ToggleBG)
        TGCorn.CornerRadius = UDim.new(0, 8)

        local Label = Instance.new("TextLabel", ToggleBG)
        Label.Size = UDim2.new(1, -50, 1, 0)
        Label.Position = UDim2.new(0, 10, 0, 0)
        Label.Text = text
        Label.TextColor3 = Color3.fromRGB(200, 200, 200)
        Label.BackgroundTransparency = 1
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.Font = Enum.Font.Gotham

        local Indicator = Instance.new("Frame", ToggleBG)
        Indicator.Size = UDim2.new(0, 30, 0, 15)
        Indicator.Position = UDim2.new(1, -40, 0.5, -7)
        Indicator.BackgroundColor3 = Color3.fromRGB(255, 50, 50) -- Đỏ khi OFF

        Instance.new("UICorner", Indicator).CornerRadius = UDim.new(1, 0)

        ToggleBG.MouseButton1Click:Connect(function()
            On = not On
            callback(On)
            -- Hiệu ứng đổi màu mượt
            if On then
                Indicator.BackgroundColor3 = Color3.fromRGB(50, 255, 50) -- Xanh khi ON
            else
                Indicator.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            end
        end)
    end

    return Elements
end

return Library
