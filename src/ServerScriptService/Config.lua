-- Config.lua
-- Game configuration and balancing

local Config = {}

-- Mining configuration
Config.MINING = {
	STONE_VALUE = 5,
	AUTO_MINE_SPEED = 0.5, -- stones per second
	CLICK_MINE_AMOUNT = 1
}

-- Machine configurations
Config.MACHINES = {
	Grinder = {
		name = "Stone Grinder",
		productionSpeed = 1, -- units per second
		outputValue = 20, -- money per unit
		unlockLevel = 1,
		cost = 50,
		upgradeCost = 25,
		description = "Grinds stones into powder"
	},
	Crusher = {
		name = "Stone Crusher",
		productionSpeed = 0.75,
		outputValue = 40,
		unlockLevel = 2,
		cost = 200,
		upgradeCost = 100,
		description = "Crushes stones into gravel"
	},
	Polisher = {
		name = "Stone Polisher",
		productionSpeed = 0.5,
		outputValue = 80,
		unlockLevel = 3,
		cost = 500,
		upgradeCost = 250,
		description = "Polishes stones into gems"
	},
	Combiner = {
		name = "Material Combiner",
		productionSpeed = 0.3,
		outputValue = 150,
		unlockLevel = 4,
		cost = 1500,
		upgradeCost = 500,
		description = "Combines materials into advanced blocks"
	}
}

-- Upgrade configurations
Config.UPGRADES = {
	FastMining = {
		name = "Faster Mining",
		cost = 100,
		description = "Mine stones 25% faster",
		effect = 0.25
	},
	DoubleOutput = {
		name = "Double Output",
		cost = 300,
		description = "All machines produce 50% more",
		effect = 0.5
	},
	AutoCollect = {
		name = "Auto Collector",
		cost = 500,
		description = "Machines auto-collect output",
		effect = 1
	},
	WorkerSpeed = {
		name = "Worker Speed Boost",
		cost = 200,
		description = "All workers move 30% faster",
		effect = 0.3
	}
}

-- Zone configurations
Config.ZONES = {
	StarterArea = {
		name = "Starter Mine",
		unlockCost = 0,
		description = "Your first stone mine",
		machineSlots = 3
	},
	FactoryArea = {
		name = "Factory",
		unlockCost = 150,
		description = "Advanced processing facility",
		machineSlots = 5
	},
	ShopZone = {
		name = "Shop",
		unlockCost = 0,
		description = "Buy upgrades and machines",
		machineSlots = 0
	},
	ExpansionZone1 = {
		name = "Expansion Site 1",
		unlockCost = 500,
		description = "First expansion area",
		machineSlots = 4
	},
	ExpansionZone2 = {
		name = "Expansion Site 2",
		unlockCost = 1500,
		description = "Premium expansion area",
		machineSlots = 6
	}
}

-- UI configurations
Config.UI = {
	MONEY_UPDATE_FREQUENCY = 0.1,
	ANIMATION_DURATION = 0.3,
	BUTTON_COOLDOWN = 0.2
}

return Config
