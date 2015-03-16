
function mymulch.register_all(mat, desc, image)

minetest.register_node("mymulch:mulch_"..mat, {
	description = desc.." Mulch",
	drawtype = "normal",
	tiles = {
		image
		},
	paramtype = "light",
	is_ground_content = true,
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {crumbly = 2, falling_node=1, not_in_creative_inventory=1, soil=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})


end
minetest.register_node("mymulch:mulch_tan", {
	description = "Mulch Tan",
	drawtype = "normal",
	tiles = {"mymulch_tan.png"},
	paramtype = "light",
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {crumbly=3, falling_node=1, soil=1, not_in_creative_inventory=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.5},
		dug = {name="default_gravel_footstep", gain=1.0},
	}),
})

















