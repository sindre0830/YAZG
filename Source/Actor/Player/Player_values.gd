extends Node

enum {
	PRIMARY_GUN,
	SECONDARY_GUN,
	THROWABLE
}

enum {
	MINI_GUN,
	PISTOL,
	MOLOTOV_COCKTAIL,
	FRAG_GRENADE, 
	NO_GRENADE
}

var current_health = 100
var current_difficulty = 1
var XP = 0
var time_end
var toolbar = [MINI_GUN, PISTOL]
var inventory = [FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE, FRAG_GRENADE]
