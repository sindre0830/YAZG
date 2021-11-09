# Game Design Document


A game design document is living document which describes the intent of the game design. 
It has two goals, first to document the decisions that have been made about the game and communicate those concepts to the entire team. 
Thus, it needs to be detailed enough for programmers to refer to when they need clarification about an aspect of the game. 
It must be able to be updated as the game is to be built. 
The need to have a game design document increases with the size of the team and length of the project. 

For a student project the intent is to capture as much as possible of your design. 
The game design will be larger than what you can achieve in a semester, but you must then decide what you need to do first. 
This document should be in version control so that you can see it changing and growing. 
Given we are using git you could also use @name to assign parts of the design to individual members of the team.


## Overview
Authors: Sindre Eiklid, Casper Melhus, Henrik Karlsen, Rickard Loland, Niklas Menzel, Martin Araya
Team: Zombie
Game title: YAZG

### Game Concept
Surviving in a zombie apocalypse with crazy guns. The player will have to navigate various stages consisting of groups of rooms connected by doors/corridors, a la Enter the Gungeon or Binding of Isaac. 
The focus is on being somewhat of a power fantasy, mowing down zombies with flashy and fun weapons that allow for a variety of playstyles.

### Genre
Roguelike, Action, Adventure
Binding of Isaac, Enter the Gungeon

### Target Audience
Both action and roguelike fans
People who want twitch-based and hectic gameplay. People that enjoy similar 2D shooter games.
Chaos enjoyers.

### Game Flow Summary
The player spawns in a room, with a basic weapon. They move around the map into other rooms, fighting zombies and picking up power-ups. Eventually they run into a boss for the stage, and have to beat it. When they beat it, they become able to progress to the next stage. 

### Look and Feel
The game will be set in an apocalyptic future, overrun with zombies (stop us if you’ve heard this before).
We are intending the look of the game to be somewhat cartoony, possibly pixel-based. This mostly depends on what kind of art assets we are able to find.
We are planning for the game to be 2D.

## Gameplay and Mechanics

### Gameplay
The players move around using WASD (or similar keybinds), aim their weapon with their mouse. They move around the map fighting hordes of zombies, and look for power-ups and similar to get stronger. Eventually they take on a powerful boss, and attempt to beat it in order to progress.

#### Game progression
The player knows they are making progress primarily in two ways. The first is through picking up items that make them stronger. This lets them kill zombies faster, hit more zombies per shot, or increases their defenses. The second way is by killing bosses and progressing through floors. This allows the player to monitor their progress in a more direct way, and compare their progress to previous playthroughs.
As our game is intended as a roguelike, progress is a lot more ephemeral than in many other games. This also means our two methods or progression are somewhat tied together - spending a lot of time (or getting lucky) and increasing character power a lot will make level progression slower but easier. Rushing through levels without exploring fully could even make the player feel like they are regressing in terms of personal power, as enemies get stronger at a more rapid pace than the player.
The player wins the game by reaching the safe-house after X (TBD) levels.

#### Mission/challenge Structure
For each map that the player clears, the difficulty will be increased. This will stop the player from clearing the entire level for the most optimal playthrough. There will also be a boss at the end of each level that needs to be defeated to progress, here the player needs to decide if they are ready.

#### Puzzle Structure
The bosses will have different mechanics that the player will need to learn to defeat.

#### Objectives
Survive → explore → get to the safe house

### Mechanics
What are the rules to the game, both implicit and explicit?
- The player shoots zombies and tries to kill them
- Zombies die when their health reaches zero.
- Zombies rush at the player and try to kill you with whatever method they have.
- Basic zombies only have melee attacks.
- Special enemies can have ranged attacks.
- The player dies when their health reaches 0.
- When the player dies, their progress is erased and they have to start over (permanent progression?)
- Players can gain power by picking up items
- Power comes in two ways - numbers get bigger (damage, health, etc) and special attacks.
- (Movement abilities?)
- Levels are beaten by killing a boss.
- When you kill a boss, you become able to move to the next level.
- Players will spawn in empty rooms in new levels, so they get their bearings.
- Players are supposed to gain power by exploring before killing bosses, in order to get the power to kill the boss and fight the tougher enemies in the following levels.

#### Physics
Wall bounce
- For enemies, to deal more damage
- Potentially for some weaponry

#### Movement
Movement: WASD or Arrows
Shoot: Cursor

#### Objects
Immovable objects: Buildings, trees, fences
Breakable objects: Crates, doors, gates, damaged walls
Hazardous: Fire, acid (From zombie spitters)
Walkable surfaces: Roads, parking lots, houses/apartments

#### Actions
Open crates (random items)
Break objects (crates, doors, gates, damaged walls) to proceed on the map

#### Combat
The player walks into a map and will have to defeat the enemies to proceed. The player will utilize projectiles, while dodging enemies. The enemies can have melee, range and AOE attack.

#### Economy
You get points for each zombie killed, used to generate a score at the end of the game, and could be used to buy items.

#### Screne Flow
A graphical description of how each scene is related to every other and a description of the purpose of each screen. (Move level to level/menu/etc)
- Scene transition between maps and levels, no transitions inside maps.
- Main menu

### Game Options
What are the options and how do they affect gameplay and mechanics?
The player will be able to choose between different items that might give buffs and debuffs. 

### Replay and Saving
The player can exit the game (in safe rooms only?) and the gamestate will save. The player can then start from that state the next time they start playing. There is only one save and saving again will overwrite it. After the player loads the save, it is deleted. As this is a roguelike, we do not want any reloading of previous saves or loading a save after death. (Potentially tough to do without letting player manually backup their save though, if they want to cheat).

(Permanent progression?)

### Cheats and Easter Eggs
Rear gun called McCallum.

## The Story, Setting, and Character

### Story and Narrative
Survive and explore the apocalyptic world. Your goal is to get to a safe house, but the player needs to explore the map for possible exits.

### Game World
The game is set in a post apocalyptic world filled with zombies who are out to get you.

#### General look and feel of the World

#### Areas
including the general description and physical characteristics as well as how it relates to the rest of the world (what levels use it, how it connects to other areas).
Initially, our idea is that each stage/level takes place in post-apocalyptic city streets, with buildings and some areas of greenery (trees etc). 
** Do we want a progression towards/away from the city boundary to simulate moving towards the safehouse, with more trees towards the city boundaries and none around the city center?

### Characters
Each character should include the back story, personality, appearance, animations, abilities, relevance to the story and relationship to other characters.
As this is a roguelike focused on core combat gameplay and mechanical character progression, we are not really planning to have much in the way of characterization

**Main Character**
- Apperance: Top-down avrage Joe lookalike
- Animations: Move, shoot, throw
- Abilities: Move, shoot, throw

## Levels

### Playing Levels
Each level should include a synopsis, the required introductory material (and how it is provided), the objectives, 
and the details of what happens in the level.  
Depending on the game, this may include the physical description of the map, the critical path that the player needs to take, 
and what encounters are important or incidental.

### Training level
The gameplay is very basic, which is good. When a player starts the game for the first time, they will get something showing the controls - WASD to move, mouse for aiming and firing. When a player picks up a powerup, encounters a boss room, and has the option to advance to a new level, we want to have a pop-up briefly explaining these things as well.

## Interface

### Visual System
HP, equipped weapon (portrait of your char?) should be displayed on the bottom of the screen
A crosshair is placed where the mousecursor is.
Boss name and healthcare shown at the top of screen.

### Control System
- WASD - move the character around.
- Move mouse to aim weapon.
- LMB to fire current weapon.
- (RMB for alt fire/grenade/whatever?)
- Scrollwheel up/down to swap weapons.
- Escape to bring up menu.

### Audio, Music, Sound Effects
- We want the game to have a foreboding BGM ideally.
- We want sound effects for at least the following:
- Firing weapons (unique for each weapon)
- Zombie attacking
- Player getting hit
- Picking up an item/power-up
- Swapping weapons
- Explosions (different for zombie acid and 

### Help System
Since the controls are very simple we could just add a very short tutorial to the start of the game later
Pop up when hovering items to show stats.

## Artificial Intelligence

### Opponent and Enemy AI
- Zombies: Very basic AI. Once engaging the player, they will always move the shortest path towards the player as they are not very smart. Player can potentially ‘lose’ them, in which case they stop following the player. When not engaged, they move around aimlessly within a small area around their spawn point.
- Special enemies: Also follows player, but a bit more advanced. Ranged enemies try to stay a certain distance from player for example. Some try to avoid hazards like thrown explosives, acid. 
- Special AI for each enemy will be added here.
- Bosses: Variable AI. Generally a mix of player-focused and predefined ‘patterns’, for example moving to the center of the room and firing a bullet hell pattern. Able to play around with this as the encounters will be confined to specially de-signed boss rooms.
- Special AI for each boss will be added here.

### Non-combat and Friendly Characters
Potentially shopkeeper NPCs - might be immersion breaking? Unsure whether we want to implement in a way that needs AI.

### Support AI

### Player and Collision Detection, Path-finding.

## Technical

### Target Hardware
We target this game towards PC-users - specifically, we intend for it to be played with a mouse and keyboard, rather than touchscreen or the like.
The game should be quite lightweight and capable of running on most older hardware (within reason).

### Development Hardware and Software (including game engine)
Game engines: Godot 2D

### Network requirements
No networking.

## Game Art

### Key assets 
How are they being developed.  Intended style.

This is an extension of parts of [cs.unc.edu](http://wwwx.cs.unc.edu/Courses/comp585-s11/585GameDesignDocumentTemplate.docx)
