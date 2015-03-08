
local mulch_list = {
		{"Black" , "black"},
		{"Brown" , "brown"},
		{"Red" , "red"},
		{"Grey" , "grey"},
--		{"Tan" , "tan"},
		{"Blue" , "blue"},
		{"Green" , "green"},
		{"Orange" , "orange"},
		{"Violet" , "violet"},
		{"Yellow" , "yellow"},
		}

for i in ipairs(mulch_list) do
	local desc = mulch_list [i][1]
	local col = mulch_list [i][2]


minetest.register_node("mymulch:mulch_"..col, {
	description = "Mulch "..desc,
	tiles = {"mymulch_"..col..".png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, soil=1, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

minetest.register_node("mymulch:mulch_tan", {
	description = "Mulch Tan",
	tiles = {"mymulch_tan.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1, soil=1, falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


minetest.register_craft({
	output = "default:dirt",
	recipe = {{"mymulch:mulch_"..col, "mymulch:mulch_"..col, "mymulch:mulch_"..col}}
})



minetest.register_craft({
	output = "mymulch:mulch_"..col.." 1",
	recipe = {
		{"mymulch:mulch_tan", "dye:"..col.."", ""},
		{"", "", ""},
		{"", "", ""}
	}
})



end

minetest.register_craft({
	output = "mymulch:mulch_tan",
	recipe = {
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"},
		{"group:leaves", "group:leaves", "group:leaves"},
	}
})

minetest.register_craft({
	output = "mymulch:mulch_tan",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:stick", "group:stick"},
	}
})

minetest.register_craft({
	output = "mymulch:mulch_tan",
	recipe = {
		{"group:flora", "group:flora", "group:flora"},
		{"group:flora", "group:flora", "group:flora"},
		{"group:flora", "group:flora", "group:flora"},
	}
})

minetest.register_craft({
	output = "mymulch:mulch_tan",
	recipe = {
		{"group:flower", "group:flower", "group:flower"},
		{"group:flower", "group:flower", "group:flower"},
		{"group:flower", "group:flower", "group:flower"},
	}
})

minetest.register_craft({
	output = "mymulch:mulch_tan 1",
	recipe = {
		{"default:dry_shrub", "default:dry_shrub", "default:dry_shrub"},
		{"default:dry_shrub", "default:dry_shrub", "default:dry_shrub"},
		{"default:dry_shrub", "default:dry_shrub", "default:dry_shrub"},
	}
})
