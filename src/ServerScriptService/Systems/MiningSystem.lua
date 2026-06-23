-- MiningSystem.lua
-- Handles stone mining and collection

local MiningSystem = {}
local LeaderStats = require(game.ServerScriptService:WaitForChild("Systems").LeaderStats)
local Config = require(game.ServerScriptService:WaitForChild("Config"))

local mining = {}

local function setupPlayerMining(player)
	local character = player.Character
	if not character then return end
	
	-- Create mining event for this player
	if not character:FindFirstChild("CanMine") then
		local canMine = Instance.new("BoolValue")
		canMine.Name = "CanMine"
		canMine.Value = true
		canMine.Parent = character
	end
	
	-- Setup auto-mining
	local autoMineSpeed = 0.5 -- Default: 2 stones per second
	local autoMiningConnection
	
	autoMiningConnection = game:GetService("RunService").Heartbeat:Connect(function()
		if not character.Parent or not character:FindFirstChild("CanMine") then
			autoMiningConnection:Disconnect()
			return
		end
		
		local canMine = character.CanMine.Value
		if canMine then
			-- Auto-mine stones
			if math.random() < 0.02 then -- 2% chance per frame = ~2 per second at 60fps
				LeaderStats.addStones(player, 1)
				LeaderStats.addMoney(player, Config.MINING.STONE_VALUE)
			end
		end
	end)
end

local function onMineClicked(player, clicks)
	if not player.Character then return end
	
	local amount = clicks or 1
	LeaderStats.addStones(player, amount)
	LeaderStats.addMoney(player, Config.MINING.STONE_VALUE * amount)
end

MiningSystem.setupPlayerMining = setupPlayerMining
MiningSystem.onMineClicked = onMineClicked

return MiningSystem
