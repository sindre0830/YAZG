### Good Code
One part of the code that I personally developed is the audio player for the game, which can be found here:
![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_audioPlayer.png?raw=true)

The code is simple enough and can generate multiple instances of audio players, that play each audio independently. And to be included and used in other pieces of code is a simple import and play (example from the gun code)
![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_GunAudio.png?raw=true)
The only extra process necessary is importing the corresponding audio file, and making sure it is imported without the repeat option selected, since it can be configured in the audio player itself.


Another part of the code that i am proud of is the code related to the guns, since extending and adding new guns in the code is as easy of extending the base code, and selecting the bullet speed and damage, while the audio and spray patterns needs to be defined in each class.

Base gun code

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_BaseGun.png?raw=true)

Assault rifle code

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_AssaultRifle.png?raw=true)

### Bad Code
The part of the code that i implemented that i consider very bad is the implementation of the portals that allow the player to move in between maps, in fact, since the idea behind changing between worlds changed, the code itself has an extra if branch that is not necessary, since we are not using the Temp folder anymore.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_portal.png?raw=true)

The code by itself does not look as problematic, however, to implement it it gets really confusing and difficult to debug, since, for a random map it requires

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_map.png?raw=true)

each of the "fences" to be mapped with the corresponding map to teleport to

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_fence.png?raw=true)

the map needs a unique "map_name.gd" file that specifies the possible entry points to the corresponding map

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/martin_mapCode.png?raw=true)

The combination of this results in that, to get one single map working correctly, the directions of all the other maps that is connected to need to be written multiple times in different files, which is easily prone to error.
### What I learnt during the course
I learnt everything about game programming and design that i know here. it was my first approach to game engines and i think that i learnt what i wanted and more. I realized that trying to program a game from scratch is more difficult than i imagined.

Even though remote work is difficult to coordinate,i think the group did a great work in doing it, the meetings that we had were spread enough to do the assigned work in between them. Usually when merging we had some problems with certain merge errors, but since everyone was in the meeting we could solve them easily.

About the Godot Engine, i think it was really easy to pick up and start developing, however, i also think that it's really easy to fall into "traps" that can make the development process more complicated further down the line. Like for example, the idea for the inheritance of the Nodes in Godot is that a parent controls all of it's children, adding or deleting them when necessary, however, we had cases where a node controlled it's own father, that were prone to error and should have been thought in a different way from the start. I think this could be alleviated with a more deep dive in the basics of the engine before starting to develop in it.

Also one of the complications that the editor for the engine gave us is that is not consistent when you click on a file, if you wanted to edit a scene, sometimes it would open the code editor instead and vice-versa which made the development of pieces of parts that are comprised of multiple files (like the portals above) more complicated than necessary.