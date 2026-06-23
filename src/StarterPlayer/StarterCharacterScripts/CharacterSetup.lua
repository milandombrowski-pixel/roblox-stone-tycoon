-- CharacterSetup.lua
-- Character initialization and movement setup

local character = script.Parent
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Setup character for mining
local canMine = Instance.new("BoolValue")
canMine.Name = "CanMine"
canMine.Value = true
canMine.Parent = character

-- Character setup complete
print("[CharacterSetup] Character " .. character.Name .. " initialized")
