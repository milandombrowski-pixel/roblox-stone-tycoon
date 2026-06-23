# Map Structure Guide

## Game World Layout

```
Workspace/
├── Terrain
├── Map/
│   ├── BasePlate
│   ├── SpawnLocation
│   └── Lighting
├── Zones/
│   ├── StarterArea/
│   │   ├── StoneQuarry/
│   │   │   ├── Stone (parts)
│   │   │   └── CollectArea (part)
│   │   ├── GrinderMachine1
│   │   ├── GrinderMachine2
│   │   └── GrinderMachine3
│   ├── FactoryArea/
│   │   ├── CrusherMachine1
│   │   ├── CrusherMachine2
│   │   ├── PolisherMachine1
│   │   └── CombinerMachine1
│   ├── ShopZone/
│   │   ├── ShopDisplay
│   │   └── UpgradeBoard
│   ├── ExpansionZone1/
│   │   └── (Locked until unlocked)
│   └── ExpansionZone2/
│       └── (Locked until unlocked)
└── Scripts/ (Already in ServerScriptService)
```

## Machine Part Structure

Each machine should have this structure:

```
MachineModel (Model)
├── MachineType (StringValue) - Value: "Grinder", "Crusher", etc.
├── MainBody (Part) - Visual representation
├── Output (IntValue) - Stores produced units
├── OutputPart (Part) - Where collected items appear
└── UpgradeLevel (IntValue) - Current upgrade level
```

## Part Requirements

### Machine Parts
- Size: Varies (Grinder: 4x4x4, Crusher: 5x5x5, etc.)
- Material: Neon or Smooth Plastic for visibility
- CanCollide: true
- Colors: Bright and distinct per machine type

### Stones in Quarry
- Size: 1x1x1 to 2x2x2
- Color: Gray (RGB: 128, 128, 128)
- Material: Slate or Rock
- Anchored: true
- CanCollide: true

### Zone Barriers (for locked zones)
- Transparency: 0.5
- CanCollide: true
- Color: Dark red or gray
- Remove or set CanCollide to false when zone unlocks

## Installation Steps

1. Create a new Roblox place file
2. In Workspace, create the Zones folder structure
3. Add parts as described above
4. Add the MachineType StringValue to each machine model
5. Add the Output IntValue to each machine
6. Copy all scripts from src/ into their respective locations
7. Run the game and test

## Testing Checklist

- [ ] Player spawns in starter area
- [ ] Mining button works and adds money
- [ ] Money displays correctly in UI
- [ ] Machines produce items
- [ ] Clicking on machine collects output
- [ ] Upgrades can be purchased
- [ ] New zones can be unlocked
- [ ] Game saves player progress (if enabled)
