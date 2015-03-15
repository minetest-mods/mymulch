local material = {}
local shape = {}
local make_ok = {}
local anzahl = {}

minetest.register_node("mybricks:machine", {
	description = "Brick Machine",
	tiles = {"mybricks_machine.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.1875, -0.5, 0.5, 0.0625, 0.5},
			{-0.5, -0.1875, -0.5, 0.5, 0.5, -0.3125}, 
			{-0.5, -0.5, -0.5, -0.3125, -0.1875, -0.3125}, 
			{0.3125, -0.5, -0.5, 0.5, -0.1875, -0.3125}, 
			{0.3125, -0.5, 0.3125, 0.5, -0.1875, 0.5},
			{-0.5, -0.5, 0.3125, -0.3125, -0.1875, 0.5}, 
			{-0.5, -0.1875, -0.5, -0.3125, 0.5, 0.5}, 
			{-0.5, -0.1875, 0.3125, 0.5, 0.5, 0.5}, 
			{0.3125, -0.1875, -0.5, 0.5, 0.5, 0.5}, 
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Brick Machine is empty (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("ingot") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10,11;]"..
		"background[-0.15,-0.25;10.40,11.75;mybricks_background.png]"..
		"list[current_name;ingot;7,2;1,1;]"..
		"list[current_name;res;7,4;1,1;]"..
		"label[7,1.5;Input:]"..
		"label[7,3.5;Output:]"..
		"label[0,0;Choose Brick Stye:]"..
		"label[1.5,1.5;Brick]"..
		"image_button[1.5,2;1,1;mybricks_mach1.png;brick; ]"..
		"label[4,1.5;Squares]"..
		"image_button[4,2;1,1;mybricks_mach2.png;square; ]"..
		"label[1.5,3.5;Small Squares]"..
		"image_button[1.5,4;1,1;mybricks_mach3.png;square_sm; ]"..
		"label[4,3.5;Tiles]"..
		"image_button[4,4;1,1;mybricks_mach4.png;tile; ]"..
		"list[current_player;main;1,7;8,4;]")
	meta:set_string("infotext", "Brick Machine")
	local inv = meta:get_inventory()
	inv:set_size("ingot", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["brick"] 
or fields["square"]
or fields["square_sm"]
or fields["tile"]
then

	if fields["brick"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mybricks:brick_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["square"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mybricks:brick_square_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["square_sm"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mybricks:brick_square_sm_"
		if inv:is_empty("ingot") then
			return
		end
	end

	if fields["tile"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mybricks:brick_tile_"
		if inv:is_empty("ingot") then
			return
		end
	end

		local ingotstack = inv:get_stack("ingot", 1)
		local resstack = inv:get_stack("res", 1)
----------------------------------------------------------------------------------
--register nodes
----------------------------------------------------------------------------------
		if ingotstack:get_name()=="default:sandstone" then
				material = "default_sandstone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_sand" then
				material = "default_desert_sand"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:clay" then
				material = "default_clay"
				make_ok = "1"
		end

		if ingotstack:get_name()=="wool:white" then
				material = "millwork_white"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:desert_stone" then
				material = "default_desert_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cobble" then
				material = "default_cobble"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:stone" then
				material = "default_stone"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:cactus" then
				material = "default_cactus"
				make_ok = "1"
		end

		if ingotstack:get_name()=="wool:white" then
				material = "millwork_white"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:sand" then
				material = "default_sand"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:wood" then
				material = "default_wood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:pinewood" then
				material = "default_pinewood"
				make_ok = "1"
		end

		if ingotstack:get_name()=="default:dirt" then
				material = "default_dirt"
				make_ok = "1"
		end
----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack:take_item()
			inv:set_stack("ingot",1,ingotstack)
		end            	
end
end


})

--Craft

minetest.register_craft({
		output = 'mybricks:machine',
		recipe = {
			{'default:brick', 'default:brick', 'default:brick'},
			{'default:brick', 'default:steel_ingot', 'default:brick'},
			{'default:brick', "default:brick", 'default:brick'},		
		},
})













