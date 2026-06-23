-- RemoteEventSetup.lua
-- Creates and manages remote events for client-server communication

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local function createEvent(name)
	if not ReplicatedStorage:FindFirstChild(name) then
		local event = Instance.new("RemoteEvent")
		event.Name = name
		event.Parent = ReplicatedStorage
	end
end

local function createFunction(name)
	if not ReplicatedStorage:FindFirstChild(name) then
		local func = Instance.new("RemoteFunction")
		func.Name = name
		func.Parent = ReplicatedStorage
	end
end

-- Create all necessary remote events
createEvent("MineEvent")
createEvent("MachineInteractEvent")
createEvent("UpgradeEvent")
createEvent("MachineUpgradeEvent")
createEvent("ZoneUnlockEvent")

-- Create remote functions
createFunction("GetMoneyFunction")
createFunction("BuyMachineFunction")

print("[RemoteEventSetup] All remote events created")
