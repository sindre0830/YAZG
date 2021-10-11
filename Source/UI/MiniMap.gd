extends MarginContainer

# Wong approach - leaving for the assets
# Can't think today, sucks

# What we want: get premade tiles based off scene (basically exits - see below for idea)
# We need NWSE tiles, NW, NE, SW, SE tiles, NWS, WSE, SEN, ENW tiles, and a NWSE tile - 13
# Then we can place the right map on screen, and update it when scene changes

# Resource: https://godotengine.org/qa/58710/natural-resources-on-2d-randomly-generated-map

# temp values
var map_index = 0
var world2 = 4		# binary 0100, north, east, south, west - our exit is east
var map = [world2]
var mapPos = map[map_index]
