This mod adds arc-nodes to Minetest as well as arcs for inner and outer corners.

Provided nodes:

default:cobble
default:mossycobble

default:stone
default:stonebrick
default:stone_block

default:desert_cobble
default:desert_stone
default:desert_stonebrick
default:desert_stone_block

default:sandstone
default:sandstonebrick
default:sandstone_block

default:brick

default:obsidian
default:obsidianbrick
default:obsidian_block

default:wood
default:junglewood
default:pine_wood
default:acacia_wood
default:aspen_wood


To make arcs from nodes of your mod, put "pkarcs?" into your depends.txt,
and call this function in your init.lua:

if minetest.get_modpath("pkarcs") then
	pkarcs.register_node("your_mod:your_nodename")
end

Tested with Minetest 0.4.15 (works with Minetest 5.0.x unless otherwise stated)


PEAK
01-20-2017

----------

TumeniNodes
2017-07-03

Added pkarcs doors.
Arched doors which work exclusively with pkarcs.

Basic options for doors are wood and metal types. (sorry, no glass types, you can add if you like)

Acacia Wood
Apple Wood (typically known as just "wood" in Minetest Game),
Aspen Wood,
Jungle Wood,
Pine Wood,

Bronze,
Copper,
Iron,
Steel,
# pkarcs
