--[[
Description: 
Feature: 
Author: Charles Zhang
]]

-- Load settings
local modName = minetest.get_current_modname()
local modPath = minetest.get_modpath(modName)
local settingPath = modPath.."/settings.lua"
dofile(settingPath)

-- Define custom nodes
mynodes = {}

-- Seriously, where is this output?
print("My Lua is loaded.")

function mynodes.myfun(bar)
    return "foo"..bar
end

-- Register a new craft item
minetest.register_node("mynodes:koensheart", {
    description = "A rare craft material found in Koen's heart, a mystical creature from ancient times.",
    tiles = {"mynodes_koensheart_side.png"},
    inventory_image = "mynodes_koensheart_item.png",
    is_ground_content = true,
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,cracky=3, stone=1, wood=1},
    -- Actions
    on_use = minetest.item_eat(18)
})

-- Register a craft for koensheart
minetest.register_craft({
    output = "mynodes:koensheart",
    recipe = {
      {MyNodes.p.wood,  MyNodes.p.wood, MyNodes.p.wood},
      {'',              MyNodes.p.wood, ''},
      {'',              '',             ''}
    }
})

-- Register behavior
minetest.register_abm({
	nodenames = {"mynodes:koensheart"},
	interval = 5,
	chance = 125,
	action = function(pos)
		minetest.add_node(pos, {name=MyNodes.p.wood})
	end,
})

-- Register tool
minetest.register_tool("mynodes:koenstool", {
    description = "Koens Tool",
    inventory_image = "mynodes_koensheart_tool.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {
                maxlevel = 2,
                uses = 20,
                times = { [1]=1.60, [2]=1.20, [3]=0.80 }
            },
        },
        damage_groups = {fleshy=2},
    },
})

-- Register a utility tool
minetest.register_tool("mynodes:clear", {
	description = "Cleaner",
	inventory_image = "default_stick.png",
	groups={not_in_creative_inventory=1},
	on_use=function(itemstack, user, pointed_thing)
		for _, ob in pairs(minetest.get_objects_inside_radius(user:get_pos(), 100)) do
			local en = ob:get_luaentity()
			if en and en.name == "__builtin:item" then
				ob:remove()
			end
		end
	end
})

-- Register node
minetest.register_node("mynodes:wooden_stair_slab", {
    -- basics
    description = "A stair.",
    tiles = {"default_pine_tree_top.png", "default_pine_tree.png", "default_pine_tree.png", "default_pine_tree.png", "default_pine_tree.png", "default_pine_tree_top.png"},
    is_ground_content = false,
    groups = {choppy=2,oddly_breakable_by_hand=1},
    -- behavior
    paramtype2 = "facedir",
    -- rendering
    drawtype = "nodebox",
    paramtype = "light",
    node_box = {
        type = "fixed",
        fixed = {
            {-0.5, -0.5, -0.5, 0.5, -0.25, -0.25},
            {-0.5, -0.25, -0.25, 0.5, 0, 0},
            {-0.5, 0, 0, 0.5, 0.25, 0.25},
            {-0.5, 0.25, 0.25, 0.5, 0.5, 0.5},
        },
    }
})