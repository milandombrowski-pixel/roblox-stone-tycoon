-- UpgradeSystem.lua
-- Handles upgrades and progression unlocks

local UpgradeSystem = {}
local LeaderStats = require(game.ServerScriptService:WaitForChild("Systems").LeaderStats)
local Config = require(game.ServerScriptService:WaitForChild("Config"))

local function setupUpgradeUI(player)
	-- This will be connected to client UI
	print("[UpgradeSystem] Setting up upgrade UI for " .. player.Name)
end

local function purchaseUpgrade(player, upgradeId)
	local upgrade = Config.UPGRADES[upgradeId]
	if not upgrade then return false end
	
	if LeaderStats.spendMoney(player, upgrade.cost) then
		print("[UpgradeSystem] " .. player.Name .. " purchased upgrade: " .. upgradeId)
		return true
	end
	return false
end

local function unlockZone(player, zoneId)
	local zone = Config.ZONES[zoneId]
	if not zone then return false end
	
	if LeaderStats.spendMoney(player, zone.unlockCost) then
		local zoneFolder = workspace:FindFirstChild("Zones")
		if zoneFolder then
			local zoneModel = zoneFolder:FindFirstChild(zoneId)
			if zoneModel then
				for _, part in pairs(zoneModel:GetDescendants()) do
					if part:IsA("BasePart") then
						part.CanCollide = true
						part.Transparency = 0
					end
				end
			end
		end
		print("[UpgradeSystem] Zone unlocked: " .. zoneId)
		return true
	end
	return false
end

UpgradeSystem.setupUpgradeUI = setupUpgradeUI
UpgradeSystem.purchaseUpgrade = purchaseUpgrade
UpgradeSystem.unlockZone = unlockZone

return UpgradeSystem
