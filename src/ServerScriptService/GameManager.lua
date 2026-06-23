-- GameManager.lua
-- Main game initialization and coordination

local Players = game:GetService("Players")
local Debris = game:GetService("Debris")

local MiningSystem = require(game.ServerScriptService:WaitForChild("Systems").MiningSystem)
local MachineSystem = require(game.ServerScriptService:WaitForChild("Systems").MachineSystem)
local UpgradeSystem = require(game.ServerScriptService:WaitForChild("Systems").UpgradeSystem)
local LeaderStats = require(game.ServerScriptService:WaitForChild("Systems").LeaderStats)
local Config = require(game.ServerScriptService:WaitForChild("Config"))

-- Initialize game
local function initializePlayer(player)
	print("[GameManager] Initializing player: " .. player.Name)
	
	-- Create leaderstats
	LeaderStats.createLeaderStats(player)
	
	-- Wait for character
	if player.Character then
		MiningSystem.setupPlayerMining(player)
		UpgradeSystem.setupUpgradeUI(player)
	end
	
	-- Setup character respawn
	player.CharacterAdded:Connect(function(character)
		print("[GameManager] Character spawned for " .. player.Name)
		MiningSystem.setupPlayerMining(player)
		UpgradeSystem.setupUpgradeUI(player)
	end)
end

-- Listen for new players
Players.PlayerAdded:Connect(function(player)
	initializePlayer(player)
end)

-- Handle disconnections
Players.PlayerRemoving:Connect(function(player)
	print("[GameManager] Player leaving: " .. player.Name)
end)

-- Initialize all machines on startup
local function initializeMachines()
	print("[GameManager] Initializing machines...")
	for _, machine in pairs(workspace:FindDescendants()) do
		if machine:FindFirstChild("MachineType") then
			MachineSystem.initializeMachine(machine)
		end
	end
end

wait(1) -- Wait for workspace to load
initializeMachines()

print("[GameManager] Game started successfully!")
