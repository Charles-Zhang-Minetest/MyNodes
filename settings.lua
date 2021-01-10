--[[
Description: 
Options:
]]

-- Declare data
MyNodes = {}
MyNodes.BlockPreset = {}

-- Define block choice presets
MyNodes.BlockPreset.DevelopmentTest = {
  air = "air",
  concrete = "basenodes:gravel",
  default = "basenodes:dirt_with_grass",
  desert_sand = "basenodes:desert_sand",
  desert_stone = "basenodes:desert_stone",
  glass = "testnodes:glasslike",
  grass = "basenodes:dirt_with_grass",
  sand = "basenodes:sand",
  stone = "basenodes:stone",
  wood = "basenodes:pine_tree"
}

MyNodes.BlockPreset.MinetestGame = {
  air = "air",
}

-- Choose appropriate set
MyNodes.BlockSettings = MyNodes.BlockPreset.DevelopmentTest
-- Define a shorthand
MyNodes.p = MyNodes.BlockSettings