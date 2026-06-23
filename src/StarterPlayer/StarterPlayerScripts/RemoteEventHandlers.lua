-- RemoteEventHandlers.lua
-- Handles remote event connections and server responses

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Wait for and handle remote events from server
local MineEvent = ReplicatedStorage:WaitForChild("MineEvent")
local MachineInteractEvent = ReplicatedStorage:WaitForChild("MachineInteractEvent")
local UpgradeEvent = ReplicatedStorage:WaitForChild("UpgradeEvent")

-- Server will respond to mine events
MineEvent.OnClientEvent:Connect(function(success, message)
	if success then
		print("[RemoteEventHandlers] Mine successful: " .. tostring(message))
	end
end)

-- Handle machine interactions
MachineInteractEvent.OnClientEvent:Connect(function(machineType, action, result)
	print("[RemoteEventHandlers] Machine action: " .. action .. " on " .. tostring(machineType))
end)

print("[RemoteEventHandlers] Remote event handlers ready")
