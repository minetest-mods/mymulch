
function mybricks.register_all(mat, desc, image, groups, craft)

minetest.register_node("mybricks:brick_"..mat, {
	description = desc.." Brick",
	drawtype = "normal",
	tiles = {
		
		image.."^mybricks_pattern2.png",
		image.."^mybricks_pattern2.png",
		image.."^mybricks_pattern1.png",
		image.."^mybricks_pattern1.png",
		image.."^mybricks_pattern3.png",
		image.."^mybricks_pattern3.png",
		},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 2,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mybricks:brick_square_"..mat, {
	description = desc.." Square Brick",
	drawtype = "normal",
	tiles = {image.."^mybricks_pattern6.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 2,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mybricks:brick_square_sm_"..mat, {
	description = desc.." Square Brick Small",
	drawtype = "normal",
	tiles = {image.."^mybricks_pattern5.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 2,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("mybricks:brick_tile_"..mat, {
	description = desc.." Tile Brick",
	drawtype = "normal",
	tiles = {image.."^mybricks_pattern2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = true,
	groups = {cracky = 2,not_in_creative_inventory=1},
	sounds = default.node_sound_stone_defaults(),
})


end
