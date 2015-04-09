 local material = {}
 local shape = {}
 local make_ok = {}
 local make_okk = {}
 local anzahl = {}
 local anzahlk = {}
 local  mulch = {}

minetest.register_node("mymulch:machine", {
	description = "Compost Machine",
	tiles = {"mymulch_machine.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=2, cracky=3, dig_immediate=1},
	node_box = {
		type = "fixed",
		fixed = {
			{0.3125, -0.5, -0.5, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, -0.3125, 0.5, 0.5}, 
			{-0.5, -0.5, 0.3125, 0.5, 0.5, 0.5}, 
			{-0.5, -0.5, -0.5, 0.5, 0.5, -0.3125}, 
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mulch Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("craft1") then
		return false
	elseif not inv:is_empty("craft2") then
		return false
	elseif not inv:is_empty("craft3") then
		return false
	elseif not inv:is_empty("craft4") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10,9;]"..
		"background[-0.15,-0.25;10.40,9.75;mysiding_background.png]"..
		"label[0,0;Mulch:]"..
		"label[1,1;Craft Mulch]"..
		"list[current_name;craft1;1,2;1,1; ]"..
		"list[current_name;craft2;1,3;1,1; ]"..
		"list[current_name;craft3;2,2;1,1; ]"..
		"list[current_name;craft4;2,3;1,1; ]"..
		"button[4,2;1,1;make;Make]"..
		"label[6,1.5;Output:]"..
		"list[current_name;res;6,2;1,1;]"..
		"label[1,4;Add any leaves, sticks, flowers or plants to make mulch]"..
		"list[current_player;main;1,5;8,4;]")
	meta:set_string("infotext", "Siding Machine")
	local inv = meta:get_inventory()
	inv:set_size("craft1", 1)
	inv:set_size("craft2", 1)
	inv:set_size("craft3", 1)
	inv:set_size("craft4", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["make"]
then 

	if fields["make"] then
		make_okk = "0"
		anzahlk = "1"
		mulch = "mymulch:mulch_tan"
		if inv:is_empty("craft1") or
		   inv:is_empty("craft2") or
		   inv:is_empty("craft3") or
		   inv:is_empty("craft4") then
			return
		end
	end
	
		local ingotstack1 = inv:get_stack("craft1", 1)
		local ingotstack2 = inv:get_stack("craft2", 1)
		local ingotstack3 = inv:get_stack("craft3", 1)
		local ingotstack4 = inv:get_stack("craft4", 1)
		local resstack = inv:get_stack("res", 1)


local leaves1 = minetest.registered_aliases[ingotstack1:get_name()]
if not leaves1 then
    leaves1 = ingotstack1:get_name()
end
local leaves2 = minetest.registered_aliases[ingotstack2:get_name()]
if not leaves2 then
    leaves2 = ingotstack2:get_name()
end
local leaves3 = minetest.registered_aliases[ingotstack3:get_name()]
if not leaves3 then
    leaves3 = ingotstack3:get_name()
end
local leaves4 = minetest.registered_aliases[ingotstack4:get_name()]
if not leaves4 then
    leaves4 = ingotstack4:get_name()
end
----------------------------------------------------------------------
local flora1 = minetest.registered_aliases[ingotstack1:get_name()]
if not flora1 then
    flora1 = ingotstack1:get_name()
end
local flora2 = minetest.registered_aliases[ingotstack2:get_name()]
if not flora2 then
    flora2 = ingotstack2:get_name()
end
local flora3 = minetest.registered_aliases[ingotstack3:get_name()]
if not flora3 then
    flora3 = ingotstack3:get_name()
end
local flora4 = minetest.registered_aliases[ingotstack4:get_name()]
if not flora4 then
    flora4 = ingotstack4:get_name()
end
----------------------------------------------------------------------
local stick1 = minetest.registered_aliases[ingotstack1:get_name()]
if not stick1 then
    stick1 = ingotstack1:get_name()
end
local stick2 = minetest.registered_aliases[ingotstack2:get_name()]
if not stick2 then
    stick2 = ingotstack2:get_name()
end
local stick3 = minetest.registered_aliases[ingotstack3:get_name()]
if not stick3 then
    stick3 = ingotstack3:get_name()
end
local stick4 = minetest.registered_aliases[ingotstack4:get_name()]
if not stick4 then
    stick4 = ingotstack4:get_name()
end

-- Check group
local iteml1 = minetest.registered_items[leaves1]
local iteml2 = minetest.registered_items[leaves2]
local iteml3 = minetest.registered_items[leaves3]
local iteml4 = minetest.registered_items[leaves4]
local itemf1 = minetest.registered_items[flora1]
local itemf2 = minetest.registered_items[flora2]
local itemf3 = minetest.registered_items[flora3]
local itemf4 = minetest.registered_items[flora4]
local items1 = minetest.registered_items[stick1]
local items2 = minetest.registered_items[stick2]
local items3 = minetest.registered_items[stick3]
local items4 = minetest.registered_items[stick4]

if items1 and items1.groups and items1.groups["stick"] or
   itemf1 and itemf1.groups and itemf1.groups["flora"] or
   iteml1 and iteml1.groups and iteml1.groups["leaves"] and
   items2 and items2.groups and items2.groups["stick"] or
   itemf2 and itemf2.groups and itemf2.groups["flora"] or
   iteml2 and iteml2.groups and iteml2.groups["leaves"] and
   items3 and items3.groups and items3.groups["stick"] or
   itemf3 and itemf3.groups and itemf3.groups["flora"] or
   iteml3 and iteml3.groups and iteml3.groups["leaves"] and
   items4 and items4.groups and items4.groups["stick"] or
   itemf4 and itemf4.groups and itemf4.groups["flora"] or
   iteml4 and iteml4.groups and iteml4.groups["leaves"] then
				material = "tan"
				make_okk = "1"

end
----------------------------------------------------------------------
----------------------------------------------------------------------
  
		if make_okk == "1" then
			local give = {}
			for i = 0, anzahlk-1 do
				give[i+1]=inv:add_item("res",mulch)
			end
			ingotstack1:take_item()
			inv:set_stack("craft1",1,ingotstack1)
			ingotstack2:take_item()
			inv:set_stack("craft2",1,ingotstack2)
			ingotstack3:take_item()
			inv:set_stack("craft3",1,ingotstack3)
			ingotstack4:take_item()
			inv:set_stack("craft4",1,ingotstack4)
		end

end
end




})


--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

minetest.register_node("mymulch:machine_dye", {
	description = "Mulch Dye Machine",
	tiles = {
		"mymulch_machine_top.png",
		"mymulch_machine_top.png",
		"mymulch_machine_side.png",
		"mymulch_machine_side.png",
		"mymulch_machine_side.png",
		"mymulch_machine_side.png",
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=2, cracky=3, dig_immediate=1},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, -0.375, 0.25, 0.5}, -- NodeBox1
			{0.375, -0.5, -0.5, 0.5, 0.25, 0.5}, -- NodeBox2
			{-0.5, -0.5, 0.375, 0.5, 0.25, 0.5}, -- NodeBox3
			{-0.5, -0.5, -0.5, 0.5, 0.25, -0.375}, -- NodeBox4
			{-0.5, -0.5, -0.5, 0.5, -0.375, 0.5}, -- NodeBox5
			{-0.0625, 0.25, 0.375, 0.0625, 0.5, 0.5}, -- NodeBox6
			{-0.0625, 0.375, -0.0625, 0.0625, 0.5, 0.5}, -- NodeBox7
			{-0.0625, 0.25, -0.0625, 0.0625, 0.375, 0.0625}, -- NodeBox8
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.25, 0.5},
		}
	},

	after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("owner",  (placer:get_player_name() or ""));
			meta:set_string("infotext",  "Mulch Dying Machine (owned by " .. (placer:get_player_name() or "") .. ")");
		end,

can_dig = function(pos,player)
	local meta = minetest.env:get_meta(pos);
	local inv = meta:get_inventory()
	if not inv:is_empty("mulch") then
		return false
	elseif not inv:is_empty("dye") then
		return false
	elseif not inv:is_empty("res") then
		return false
	end
	return true
end,

on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "invsize[10,9;]"..
		"background[-0.15,-0.25;10.40,9.75;mysiding_background.png]"..
		"label[0,0;Mulch:]"..
		"label[1,1;Color Mulch]"..
		"label[1,1.5;Mulch:]"..
		"list[current_name;mulch;1,2;1,1;]"..
		"label[2.5,1.5;Dye:]"..
		"list[current_name;dye;2.5,2;1,1;]"..
		"button[4,2;1,1;color;Color]"..
		"label[6,1.5;Output:]"..
		"list[current_name;res;6,2;1,1;]"..
		"label[1,3.5;Add Tan colored mulch and dye to make colored mulch]"..
		"list[current_player;main;1,5;8,4;]")
	meta:set_string("infotext", "Siding Machine")
	local inv = meta:get_inventory()
	inv:set_size("mulch", 1)
	inv:set_size("dye", 1)
	inv:set_size("res", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
	local meta = minetest.env:get_meta(pos)
	local inv = meta:get_inventory()

if fields["color"]
then 

	if fields["color"] then
		make_ok = "0"
		anzahl = "1"
		shape = "mymulch:mulch_"
		if inv:is_empty("mulch") or
		inv:is_empty("dye") then
			return
		end
	end



		local ingotstack = inv:get_stack("mulch", 1)
		local ingotstack2 = inv:get_stack("dye", 1)
		local resstack = inv:get_stack("res", 1)
		local mulch_color = mat

----------------------------------------------------------------------
		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:black" then
				material = "black"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:blue" then
				material = "blue"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:brown" then
				material = "brown"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:cyan" then
				material = "cyan"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:dark_green" then
				material = "dark_green"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:dark_grey" then
				material = "dark_grey"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:green" then
				material = "green"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:grey" then
				material = "grey"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:magenta" then
				material = "magenta"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:orange" then
				material = "orange"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:pink" then
				material = "pink"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:red" then
				material = "red"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:violet" then
				material = "violet"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:white" then
				material = "white"
				make_ok = "1"
		end

		if ingotstack:get_name()=="mymulch:mulch_tan" and
		   ingotstack2:get_name()=="dye:yellow" then
				material = "yellow"
				make_ok = "1"
		end
----------------------------------------------------------------------
		if make_ok == "1" then
			local give = {}
			for i = 0, anzahl-1 do
				give[i+1]=inv:add_item("res",shape..material)
			end
			ingotstack:take_item()
			inv:set_stack("mulch",1,ingotstack)
			ingotstack2:take_item()
			inv:set_stack("dye",1,ingotstack2)
		end

end
end




})
--Craft

minetest.register_craft({
		output = 'mymulch:machine',
		recipe = {
			{'group:leaves', 'group:wood', 'group:leaves'},
			{'group:wood', 'default:apple', 'group:wood'},
			{'group:leaves', "group:wood", 'group:leaves'},		
		},
})
minetest.register_craft({
		output = 'mymulch:machine_dye',
		recipe = {
			{'group:leaves', 'group:wood', 'group:leaves'},
			{'group:wood', 'bucket:bucket_empty', 'group:wood'},
			{'group:leaves', "group:wood", 'group:leaves'},		
		},
})












