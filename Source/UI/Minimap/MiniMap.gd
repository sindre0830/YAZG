extends MarginContainer

# We probably don't need a separate scene for minimap itself since we just have
# one UI that carries over between scenes, and the center room should never move.
# All four directions added atm for tweaking/tuning

# Then add correct map-scene to world-scene, and update it when scene changes

# temp values for idea
var map_index = 0
var world2 = 4		# binary 0100, north, east, south, west - our exit is east
var map = [world2]
var mapPos = map[map_index]
