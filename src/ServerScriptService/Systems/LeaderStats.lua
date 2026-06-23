-- LeaderStats.lua
-- Handles player statistics and currency

local LeaderStats = {}

local function createLeaderStats(player)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	-- Money stat
	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Value = 100 -- Starting money
	money.Parent = leaderstats
	
	-- Stones collected stat
	local stonesCollected = Instance.new("IntValue")
	stonesCollected.Name = "StonesCollected"
	stonesCollected.Value = 0
	stonesCollected.Parent = leaderstats
	
	-- Total earnings stat
	local totalEarnings = Instance.new("IntValue")
	totalEarnings.Name = "TotalEarnings"
	totalEarnings.Value = 0
	totalEarnings.Parent = leaderstats
	
	-- Level/Progression
	local level = Instance.new("IntValue")
	level.Name = "Level"
	level.Value = 1
	level.Parent = leaderstats
	
	return leaderstats
end

local function addMoney(player, amount)
	local money = player.leaderstats:FindFirstChild("Money")
	if money then
		money.Value = money.Value + amount
		local totalEarnings = player.leaderstats:FindFirstChild("TotalEarnings")
		if totalEarnings then
			totalEarnings.Value = totalEarnings.Value + math.abs(amount)
		end
	end
end

local function getMoney(player)
	local money = player.leaderstats:FindFirstChild("Money")
	return money and money.Value or 0
end

local function spendMoney(player, amount)
	local money = player.leaderstats:FindFirstChild("Money")
	if money and money.Value >= amount then
		money.Value = money.Value - amount
		return true
	end
	return false
end

local function addStones(player, amount)
	local stonesCollected = player.leaderstats:FindFirstChild("StonesCollected")
	if stonesCollected then
		stonesCollected.Value = stonesCollected.Value + amount
	end
end

LeaderStats.createLeaderStats = createLeaderStats
LeaderStats.addMoney = addMoney
LeaderStats.getMoney = getMoney
LeaderStats.spendMoney = spendMoney
LeaderStats.addStones = addStones

return LeaderStats
