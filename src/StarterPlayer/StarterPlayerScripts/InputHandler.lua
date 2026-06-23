-- InputHandler.lua
-- Handles player input for mining and machine interactions

local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Create remote events if they don't exist
local function ensureRemoteEvent(name)
	local event = ReplicatedStorage:FindFirstChild(name)
	if not event then
		event = Instance.new("RemoteEvent")
		event.Name = name
		event.Parent = ReplicatedStorage
	end
	return event
end

local MineEvent = ensureRemoteEvent("MineEvent")
local MachineInteractEvent = ensureRemoteEvent("MachineInteractEvent")
local UpgradeEvent = ensureRemoteEvent("UpgradeEvent")

-- Mouse click for mining near stone piles
local lastInteractionTime = 0

mouse.Button1Down:Connect(function()
	local now = tick()
	if now - lastInteractionTime >= 0.2 then
		lastInteractionTime = now
		
		local targetObject = mouse.Target
		if targetObject then
			if targetObject.Parent and targetObject.Parent:FindFirstChild("MachineType") then
				-- Clicked on a machine
				MachineInteractEvent:FireServer(targetObject.Parent, "collect")
			elseif targetObject.Name == "Stone" or targetObject.Parent.Name == "StoneQuarry" then
				-- Clicked on stone
				MineEvent:FireServer(1)
			end
		end
	end
end)

-- Keyboard shortcuts
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.U then
		-- Open upgrades menu
		UpgradeEvent:FireServer("openUpgrades")
	end
end)

print("[InputHandler] Input handler initialized")
