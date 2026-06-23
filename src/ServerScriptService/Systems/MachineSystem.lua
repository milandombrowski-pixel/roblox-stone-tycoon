-- MachineSystem.lua
-- Handles machine operations and material processing

local MachineSystem = {}
local LeaderStats = require(game.ServerScriptService:WaitForChild("Systems").LeaderStats)
local Config = require(game.ServerScriptService:WaitForChild("Config"))

local activeMachines = {}

local function initializeMachine(machineModel)
	local machineType = machineModel:FindFirstChild("MachineType")
	if not machineType then return end
	
	local config = Config.MACHINES[machineType.Value]
	if not config then return end
	
	print("[MachineSystem] Initialized machine: " .. machineType.Value)
	
	-- Store machine data
	activeMachines[machineModel] = {
		type = machineType.Value,
		level = 1,
		productionSpeed = config.productionSpeed,
		lastProduction = tick(),
		isProcessing = false
	}
	
	-- Start production loop
	local productionConnection
	productionConnection = game:GetService("RunService").Heartbeat:Connect(function()
		if not machineModel.Parent then
			productionConnection:Disconnect()
			activeMachines[machineModel] = nil
			return
		end
		
		local machineData = activeMachines[machineModel]
		if machineData and (tick() - machineData.lastProduction) >= (1 / machineData.productionSpeed) then
			local output = machineModel:FindFirstChild("Output")
			if output then
				-- Simulate output production
				output.Value = (output.Value or 0) + 1
				machineData.lastProduction = tick()
			end
		end
	end)
end

local function upgradeMachine(player, machineModel)
	local machineType = machineModel:FindFirstChild("MachineType")
	if not machineType then return false end
	
	local machineData = activeMachines[machineModel]
	if not machineData then return false end
	
	local upgradeCost = Config.MACHINES[machineType.Value].upgradeCost * (machineData.level ^ 2)
	
	if LeaderStats.spendMoney(player, upgradeCost) then
		machineData.level = machineData.level + 1
		machineData.productionSpeed = machineData.productionSpeed * 1.5
		print("[MachineSystem] Machine upgraded to level " .. machineData.level)
		return true
	end
	return false
end

local function collectOutput(player, machineModel)
	local output = machineModel:FindFirstChild("Output")
	if output and output.Value > 0 then
		local config = Config.MACHINES[machineModel:FindFirstChild("MachineType").Value]
		local earnings = output.Value * config.outputValue
		LeaderStats.addMoney(player, earnings)
		output.Value = 0
		return true
	end
	return false
end

MachineSystem.initializeMachine = initializeMachine
MachineSystem.upgradeMachine = upgradeMachine
MachineSystem.collectOutput = collectOutput
MachineSystem.getActiveMachines = function() return activeMachines end

return MachineSystem
