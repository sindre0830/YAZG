extends MarginContainer

# We probably don't need a separate scene for minimap itself since we just have
# one UI that carries over between scenes, and the center room should never move.
# All four directions added atm for tweaking/tuning

# Then add correct map-scene to world-scene, and update it when scene changes

# Store minimap as array of bools - north, west, south, east
export var map = [false,false,false,false]

# called onReady player
func updateMinimap():
	getMinimap()
	setMinimap()


# Gets the minimap for current scene from world's mapStatus node
func getMinimap():
	map = self.get_parent().get_parent().get_parent().get_node("mapStatus").map	
	print(map)
	
# Sets visibility for minimap-cardinals based on current minimap
func setMinimap():
	get_node("MiniMapNorth").visible = map[0]
	get_node("MiniMapWest").visible = map[1]
	get_node("MiniMapSouth").visible = map[2]
	get_node("MiniMapEast").visible = map[3]
