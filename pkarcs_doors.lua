screwdriver = screwdriver or {}

pkarcs_doors = {}

-- Register Door Nodes
pkarcs_doors.door = {
    {"steel", "Steel", {cracky = 1, door = 1}, default.node_sound_metal_defaults(), "doors_metal", {name = "doors_door_steel.png",backface_culling = true}, "default:steelblock"},
	{"obsidian_glass", "Obsidian Glass", {cracky = 1, door = 1}, default.node_sound_glass_defaults(), "doors_glass", {name = "doors_door_obsidian_glass.png"},"default:obsidian_glass"},
	{"glass", "Glass", {cracky = 3, door = 1}, default.node_sound_glass_defaults(), "doors_glass", {name = "doors_door_glass.png"}, "default:glass"},
	{"wood", "Wood", {choppy = 2, door = 1}, default.node_sound_wood_defaults(), "doors_door", {name = "arch_door_L.png",backface_culling = true}, "default:wood"},
}

for _, row in ipairs(pkarcs_doors.door) do
	local name = row[1]
	local desc = row[2]
	local mat_groups = row[3]
	local mat_sound = row[4]
	local door_sound = row[5]
    local door_tiles = row[6]
    local craft_material = row[7]

minetest.register_node(":pkarcs_doors:" ..name.. "_Ldoor", {
	description = desc.. "_Arch_Door (left)",
	inventory_image = "arch_door_L_inv.png",
	wield_image = "arch_door_L_inv.png",
	drawtype = "mesh",
	mesh = "arch_door_L.obj",
	tiles = {door_tiles},
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "facedir",
	on_rotate = screwdriver.rotate_simple,
	sunlight_propogates = true,
	is_ground_content = false,
	groups = mat_groups,
	sounds = mat_sound,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.4375, -0.375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.4375, -0.375},
		},
	},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "pkarcs_doors:" ..name.. "_Ldoor_open", param2 = node.param2})
		minetest.sound_play(door_sound.."_open", {gain = 0.20, max_hear_distance = 2})
	end,
})

minetest.register_node(":pkarcs_doors:" ..name.. "_Ldoor_open", {
	drawtype = "mesh",
	mesh = "arch_door_L_open.obj",
	tiles = {door_tiles},
	use_texture_alpha = true,
	paramtype = "light",
	paramtype2 = "facedir",
	on_rotate = screwdriver.rotate_simple,
	legacy_facedir_simple = true,
	sunlight_propogates = true,
	is_ground_content = false,
	groups = mat_groups,
	drop = "pkarcs_doors:" ..name.. "_Ldoor",
	sounds = mat_sound,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -1.4375, -0.375, 1.4375, -0.4375},
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -1.4375, -0.375, 1.4375, -0.4375},
		},
	},
	on_rightclick = function(pos, node, puncher)
		minetest.swap_node(pos, {name = "pkarcs_doors:" ..name.. "_Ldoor", param2 = node.param2})
		minetest.sound_play(door_sound.."_close", {gain = 0.15, max_hear_distance = 2})
	end,
})
end
