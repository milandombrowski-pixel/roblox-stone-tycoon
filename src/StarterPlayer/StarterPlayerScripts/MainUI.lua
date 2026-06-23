-- MainUI.lua
-- Main user interface for the tycoon game

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local leaderstats = player:WaitForChild("leaderstats")
local money = leaderstats:WaitForChild("Money")

-- Create main screen GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MainUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Money display
local moneyLabel = Instance.new("TextLabel")
moneyLabel.Name = "MoneyDisplay"
moneyLabel.Size = UDim2.new(0, 300, 0, 60)
moneyLabel.Position = UDim2.new(0, 20, 0, 20)
moneyLabel.BackgroundColor3 = Color3.fromRGB(46, 125, 50)
moneyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyLabel.TextSize = 32
moneyLabel.Font = Enum.Font.GothamBold
moneyLabel.TextScaled = true
moneyLabel.BackgroundTransparency = 0.2
moneyLabel.BorderSizePixel = 0
moneyLabel.Parent = screenGui

-- Add corner radius
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 10)
corner.Parent = moneyLabel

-- Update money display
local function updateMoneyDisplay()
	moneyLabel.Text = "💰 $" .. tostring(money.Value)
end

money.Changed:Connect(updateMoneyDisplay)
updateMoneyDisplay()

-- Stats display
local statsLabel = Instance.new("TextLabel")
statsLabel.Name = "StatsDisplay"
statsLabel.Size = UDim2.new(0, 300, 0, 100)
statsLabel.Position = UDim2.new(0, 20, 0, 100)
statsLabel.BackgroundColor3 = Color3.fromRGB(33, 150, 243)
statsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statsLabel.TextSize = 18
statsLabel.Font = Enum.Font.Gotham
statsLabel.TextScaled = false
statsLabel.BackgroundTransparency = 0.2
statsLabel.BorderSizePixel = 0
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.Parent = screenGui

-- Add corner radius
local statsCorner = Instance.new("UICorner")
statsCorner.CornerRadius = UDim.new(0, 10)
statsCorner.Parent = statsLabel

-- Add padding
local statsPadding = Instance.new("UIPadding")
statsPadding.PaddingLeft = UDim.new(0, 10)
statsPadding.PaddingTop = UDim.new(0, 10)
statsPadding.Parent = statsLabel

-- Update stats display
local function updateStats()
	local stones = leaderstats:FindFirstChild("StonesCollected")
	local earnings = leaderstats:FindFirstChild("TotalEarnings")
	local level = leaderstats:FindFirstChild("Level")
	
	local statsText = "⛏️ Stones: " .. (stones and stones.Value or 0) .. "\n"
	statsText = statsText .. "📊 Earnings: $" .. (earnings and earnings.Value or 0) .. "\n"
	statsText = statsText .. "⭐ Level: " .. (level and level.Value or 1)
	
	statsLabel.Text = statsText
end

local stones = leaderstats:FindFirstChild("StonesCollected")
local earnings = leaderstats:FindFirstChild("TotalEarnings")
local level = leaderstats:FindFirstChild("Level")

if stones then stones.Changed:Connect(updateStats) end
if earnings then earnings.Changed:Connect(updateStats) end
if level then level.Changed:Connect(updateStats) end
updateStats()

-- Mining button
local mineButton = Instance.new("TextButton")
mineButton.Name = "MineButton"
mineButton.Size = UDim2.new(0, 150, 0, 50)
mineButton.Position = UDim2.new(1, -170, 1, -70)
mineButton.BackgroundColor3 = Color3.fromRGB(255, 152, 0)
mineButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mineButton.TextSize = 24
mineButton.Font = Enum.Font.GothamBold
mineButton.Text = "⛏️ MINE"
mineButton.BackgroundTransparency = 0.1
mineButton.BorderSizePixel = 0
mineButton.Parent = screenGui

-- Add corner radius
local mineCorner = Instance.new("UICorner")
mineCorner.CornerRadius = UDim.new(0, 10)
mineCorner.Parent = mineButton

-- Mine button click handler
local lastMineClick = 0
mineButton.MouseButton1Click:Connect(function()
	local now = tick()
	if now - lastMineClick >= 0.2 then
		lastMineClick = now
		
		-- Send mining event to server
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local mineEvent = ReplicatedStorage:FindFirstChild("MineEvent")
		if mineEvent then
			mineEvent:FireServer(1)
		end
		
		-- Visual feedback
		mineButton.BackgroundColor3 = Color3.fromRGB(255, 193, 7)
		game:GetService("Debris"):AddItem(mineButton, 0)
		wait(0.1)
		mineButton.BackgroundColor3 = Color3.fromRGB(255, 152, 0)
	end
end)

-- Help text
local helpLabel = Instance.new("TextLabel")
helpLabel.Name = "HelpText"
helpLabel.Size = UDim2.new(0, 400, 0, 60)
helpLabel.Position = UDim2.new(0.5, -200, 1, -80)
helpLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
helpLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
helpLabel.TextSize = 16
helpLabel.Font = Enum.Font.Gotham
helpLabel.Text = "💡 Click MINE or place machines to earn money!"
helpLabel.BackgroundTransparency = 0.3
helpLabel.BorderSizePixel = 0
helpLabel.Parent = screenGui

-- Add corner radius
local helpCorner = Instance.new("UICorner")
helpCorner.CornerRadius = UDim.new(0, 10)
helpCorner.Parent = helpLabel

print("[MainUI] User interface loaded for " .. player.Name)
