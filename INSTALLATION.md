# Roblox Stone Tycoon - Installation Guide

## Requirements
- Roblox Studio (Latest version)
- A Roblox account
- Basic understanding of Roblox structure

## Step-by-Step Installation

### 1. Create a New Place
- Open Roblox Studio
- Create a new place (any template)
- Save it with a descriptive name (e.g., "Stone Tycoon")

### 2. Copy Script Files

#### ServerScriptService Scripts
Copy these files to ServerScriptService:
- `src/ServerScriptService/GameManager.lua` → GameManager (as a Script)
- `src/ServerScriptService/Config.lua` → Config (as a ModuleScript)

Create a folder called `Systems` in ServerScriptService and add:
- `LeaderStats.lua` (ModuleScript)
- `MiningSystem.lua` (ModuleScript)
- `MachineSystem.lua` (ModuleScript)
- `UpgradeSystem.lua` (ModuleScript)

#### StarterPlayer Scripts
Copy to StarterPlayer > StarterCharacterScripts:
- `CharacterSetup.lua` → CharacterSetup (as a LocalScript)

Copy to StarterPlayer > StarterPlayerScripts:
- `MainUI.lua` → MainUI (as a LocalScript)
- `InputHandler.lua` → InputHandler (as a LocalScript)
- `RemoteEventHandlers.lua` → RemoteEventHandlers (as a LocalScript)

#### ReplicatedStorage
Copy to ReplicatedStorage:
- `RemoteEventSetup.lua` (as a Script)

### 3. Build the Map

Follow the structure in `MapStructure.md`:

1. Create a Zones folder in Workspace
2. Create subfolders for each zone (StarterArea, FactoryArea, etc.)
3. Add BasePlate and lighting
4. Create machine models with required parts:
   - StringValue named "MachineType" (value: machine type)
   - Part named "MainBody" (visual representation)
   - IntValue named "Output" (starts at 0)

### 4. Configure Game Settings

Edit `src/ServerScriptService/Config.lua` to adjust:
- Mining values (MINING.STONE_VALUE)
- Machine speeds and prices (MACHINES table)
- Upgrade costs (UPGRADES table)
- Zone unlock costs (ZONES table)

### 5. Test the Game

1. Click "Run Game" in Roblox Studio
2. Check that:
   - You spawn in the starter area
   - Money displays in the top-left
   - The MINE button works
   - Machines produce items
   - UI updates correctly

### 6. Troubleshooting

**Scripts not running:**
- Check that scripts are in the correct location
- Verify no syntax errors in the script output
- Ensure ModuleScripts are returning their tables

**UI not appearing:**
- Check StarterPlayer structure
- Verify LocalScripts are in StarterPlayerScripts folder
- Clear PlayerGui and reload

**Machines not working:**
- Verify each machine has a MachineType StringValue
- Check that machine is in workspace.Zones
- Confirm Output IntValue exists on machine

**Money not updating:**
- Check LeaderStats is created (player.leaderstats.Money)
- Verify Money is an IntValue
- Check console for errors

## Next Steps

After successful installation:

1. **Customize colors and visuals:**
   - Edit part colors in the workspace
   - Modify UI colors in MainUI.lua

2. **Adjust economy balance:**
   - Change prices in Config.lua
   - Test with different values
   - Watch for money inflation

3. **Add more machines:**
   - Add new entries to Config.MACHINES
   - Create corresponding machine models
   - Test production and collection

4. **Expand zones:**
   - Add more zone folders
   - Create zone models with machines
   - Add to Config.ZONES

5. **Add game mechanics:**
   - Implement workers
   - Add special events
   - Create prestige/rebirth system
