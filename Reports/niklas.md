# Individual Report - Niklas Menzel

## Score weighting
|Description | min | def | max |
|----|----|----|----|
|Gameplay video | 5 | 10 | 20 |
|Code video | 0 | 10 | 15 |
|Good Code  | 10 | 20 | 30 |
|Bad Code | 10 | 20 | 30 |
|Development process | 10 | 20 | 30 |
|Reflection | 10 | 20 | 30 |

|Description | my weighting |
|----|----|
|Gameplay video | 10 |
|Code video | 0 |
|Good Code  | 15 |
|Bad Code | 15 |
|Development process | 30 |
|Reflection | 30 |

## Code I consider good
When I think of code I wrote during this project that I consider good I first think of the levels of abstractions I created.
When I started working on the categories *Actor* and *Breakable* I first created a list of behavior that all objects in the said category share. I then created a GD script that contained these methods for this behavior so that
every other script in the category could just inherit it. I consider that good code because it prevents redundancies in code and also improves readability. I am especially proud of the code in the [Actor.gd](https://github.com/sindre0830/YAZG/blob/main/Source/Actor/Actor.gd) script as the abstraction was later carried on and used as the base for another layer of abstraction for the zombie classes in [Enemy.gd](https://github.com/sindre0830/YAZG/blob/main/Source/Actor/Enemy.gd).
I also consider the code good that I've added to the [player movement](https://github.com/sindre0830/YAZG/blame/main/Source/Actor/Player/Player.gd#L60).\
![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/Movement_Direction.png)\
This code is a bit special since it was the only time I had to write code I would consider
a bit more complicated since most of the time Godot already provided simple solutions. The code adjusts the players movement speed depending on where they are facing.
The basic idea was that the more the direction of view and the direction of movement differ, the slower the player should run.
Although the implementation contains some mathematical expressions the code remains understandable because of the comments.
The comments don't go into too much detail, but they are descriptive enough so that anyone can easily understand what the code is about. This makes the code good code.

## Code I consider bad
I am particularly unhappy with my implementation that dynamically spawns zombies and crates. It has quite a long history since it took
some time to come up with an implementation that actually reliably works. At first I tried to spawn zombies by randomly choosing a tile of the currently loaded map. I would spawn the zombie on that tile if it was a walkable tile and didn't have any surrounding tiles that would collide with the zombie. Otherwise I would draw another random tile.
This would have been a very efficient and suitable solution for the problem. Unfortunately my code had some problems that I could not fix. First of all zombies would sometimes glitch outside of the map right after spawning. The other big problem was that zombies sometimes turned invisible and I couldn't figure out why this was happening.
Since time was running short I had to come up with a working solution and the result got very hacky.
The solution is implemented in [BaseWorld.gd](https://github.com/sindre0830/YAZG/blob/main/Source/World/Scripts/BaseWorld.gd).
As you can see the spawn positions are randomly drawn from **CrateSpawn** and **EnemySpawn** which are nodes in the currently loaded scene. Our maps consist of multiple scenes. Each scene has to contain these nodes in order to have the spawns work correctly. These nodes are **Path2D** nodes which had to be drawn manually in each scene. This means there is a lot of redundant elements in the scenes that took a lot of repetitive work to add them to the project.

## Reflection about key concepts I learned
Going into this class it was the first time working on a programming project as a group for me.
Before I only attended classes in which I programmed on my own.
I think that this introduced a lot of challenges as well as opportunities for me and I learned a lot in the process especially about how one can coordinate and structure a group project.
One key concepts I had to get used to right from the start was remote work. At first I wasn't sure if remote work would
turn out to be efficient enough but our approach convinced me quickly. We set up a couple of appointments so that we would
meet in a voice channel at least twice a week to discuss progress and problems. We also used these meetings for short scrum sessions in which we made extensive use of GitHubs issue tracking system. 
Every group member was assigned issues during these sessions which they would work on for the next days. 
Overall this allowed for a steady and controlled progress and I think we can be proud on the result in the end.

Even though the group work was a big success I thought about what we could have done differently if we could start all over again.
I think in hindsight, it would have been better to agree on how to handle merging and testing code. We often ran into the problem of 
merge conflicts which probably could have been avoided by using the pull request mechanism in GitHub.
We also missed out on implementing some basic quality assurance approaches. We obviously did a lot of play testing but we 
probably could have done it in a more structured manner. For example we could have documented some basic manual tests for 
the most important features and develop some integration tests for key parts of the code.

The second thing that comes to my mind is my learning outcome on the Godot engine.
I will just focus on what I learned about game engine concepts since we already discussed advantages and disadvantages of the engine in our group discussion.
First of all there was a lot of basic knowledge I gathered during the project. This was mostly about Godots IDE, the scene editor, project configuration and the basic building blocks which are nodes that can be connected to form trees.
The most important way of interacting with these nodes where callback function.
It was great to see that we could create a whole game with comparably little effort since we didn't have to worry about
the complicated handling of inputs, rendering or physics. All the complicated work was already handled by Godot.
Thus, the biggest learning outcome for me was to know which of Godots nodes are applicable for a certain type of feature I
want to implement. A good example for this are the *KinematicBody2D* and the *RigidBody2D* which already brings me to my
next talking point which is performance considerations.
We used the *KinematicBody2D* for the player and enemy entities as it allowed for moving it including collisions with other
objects. This means that it already did some basic physics computations in the background but they are still lightweight.
We also could have used the *RigidBody2D* which simulates a physical object in the 2D space. Instead of directly moving it
you apply forces to it and let the physics engine do the rest. It also takes forces like gravity into consideration.
Since it had no benefits for our top-down shooter we decided to stick with the more CPU friendly *KinematicBody2D*.
We did however find a use for the *RigidBody2D* later on when we were implementing grenades that were supposed to bounce of walls.
Since there would be only one grenades at a time in the game they didn't have a huge impact on performance even though they are a *RigidBody2D*.
