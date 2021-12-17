# Individual Report Henrik M. Karlsen 

### Score weighting
|Description | my weight |
|----|----|
|Gameplay video | 15 |
|Code video | 0 |
|Good Code  |10 |
|Bad Code | 25 |
|Development process | 30 |
|Reflection | 20 |

### Good Code
I consider the handling of the experience the player gets when a zombie is killed. I find the UI very appealing. The code is created so that when you get inside a required are of the experience instance it will interpolate toward you for 0,5 seconds and disapear after that time. The reason I find this code good is because I spent some time testing and making sure that the experience would not have any logical errors on the placement, movement or the interpolating time. Making the visual effect seem appealing to the player. The code for the experience handling is below.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_XP_handling.PNG?raw=true)

Another part of my code that I consider good is the implementation of the breakable objects. I cannot take ownership over all the code in the breakable objects folder since the box.gd and the breakable.gd has been modified, but I though my general implementation and inheritance structure was easy to work with and made it easy for others to use as part of either testing or implementing the breakables in the game.


### Bad Code
One part of my code which I consider very bad is the calculation of high score. This has partly to do with not spending enough time on it and the group collective idea that this aspect of the game should not be prioritized but needs to be included in the final result. We wanted players to get a score when they die, and when they win the game. The score calculation per now is the amount of experience (XP) you have gathered divided on the total playing time. The image of the code can be seen below.
![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_XP_bad.PNG?raw=true)

There are some problems with this code and maybe the biggest is that the calculation is similar when you die and when you win. If given more time I would probably use the difficulty also as a factor to calculate the score. To illustrate the problem I have created this scheme:

|nr | Time | XP | Score |
|----|----|----|----|
|1 | 10 | 100 | 10 |
|2 | 20 | 400 | 20 |
|3 | 30 | 200 | 6.67 |
|4 | 1000 | 5600 | 5.6 |
|5 | 1800 | 3900 | 2.17 |

As you can see from the table, I think actually that the score is alright if it only was calculated when the player has successfully finished the game, by this I mean that the score difference is kind of what we want. But it does not work well when players die at early stages while killing some zombies. Further improvements would include some kind of level check and multiplition factor based on how much progress the player have made. Maybe also have a kind of logic to binding the maximum value you could get as score for each level. One example of this is: level 1 = (0p-100p), level 2 = (100p-200p), ... level n = (p-p+100). where p is the max from the previous round. 

Another part of my code which I considered bad is also connected to the score but another game concept. We wanted to calculate the score, and I think that is a nice way to make the game fun and rewarding for the players. The bad thing about this would be how we implemented the gaining of the score. What I think is bad is how much of the game is based on randomness. From the spawning of zombies to how much experience will drop for each zombie kill. This means that if someone would play this game competitively or have a challenge with others, they would have to be dependent on luck. Since you must kill all the zombies before a room opens, it seems kind of arbitrary to spawn the zombies random and also have the experience per kill to be random. I have written the experience drop randomness and will include the necessary code below.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_XP_init.PNG?raw=true)

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_random_init.PNG?raw=true)

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_XP_randomness.PNG?raw=true)

The fact that you could get between one to five for each time you kill the zombie is not a bad decision on its own, but as a change to this it would have been nice to include some logic behind the amount you get. For example, the experience amount could be based on the time you have been in the room, so killing zombies faster would give more XP. Or using other factors than randomness so the player can get guidance on how to become better at the game.


### Reflection
#### The Godot Engine and Documentation
When reflecting about the key concepts learned I think it’s necessary to include the godot specific, game engine knowledge I have picked up during the course. The way of building a game by building a tree structure of node’s is one learning outcome, and also how these nodes/scenes can interact with each other using signals. Another learning outcome was actually how to use and customize the different nodes which godot has to offer. With what I did for the project I used StaticBody2D and area2D for the most of my game objects. By starting at scratch using an editor and a laguage you have never heard about before also contribute to knowledge on how important it is to read documentation, how you should approach documentations and at the end of the project, when you have gained all this new knowledge reflect on how you could have improved the documentation reading strategy you used. When I started reading the documentation I was impation to get started with seeing some result on my screen. The lack of reading the documentation carefully I got some problems early on having to go back and fill in the gaps I had missed when randomly searched around trying to get results quick. Especially since this is my first time creating a game it would have been more feasable to read and understand the components before I started trying to implement them. This was actually a major breakthrough for me. Although I thought that my documentation reading was good, I have to read the neccesary documentation carefully, especially when I'm working with languages and IDE's I have never handeled before.

#### Game Development
I learned a lot about game development, and also group development. I was kind of unexperienced on working the way we did for the project. Always working on your own branch and having to commit in a certain fashion to link the commit to the issue. I must sadly say that I had some problems with the commit style and did not always get the linking right but by using this kind of trunk-based development and make sure that the new implementations where committed quick really made the development process easier than I have experienced it from earlier projects. One lesson learned, that is applicable to many projects is the need to continiously decide what that should be prioritized in the game and both assign a priority and hardness estimate. We had prioritization which made it easy to prioritize what issues to begin with, but in highsight it would be even better if we did an estimate on the different issues and as we finished tasks, especially after the MVP it would have been a great idea to review the estimates from that epoch. By this I mean use the estimates as a framework for diciding the new estimated values on the new issues.

#### Optimization
After watching the game optimization lecture I started checking out the profiling option in the godot editor. This was very useful to know when trying to figure out where the program had issues when my code lead to poor performance. For the most times the issue was that I was calling some heavy computing algorithms in the wrong place. Meaning the places where they are run every frame. After a quick check in the profiler i could see that these functions probably should be moved or have some timer preventing them from beeing run every frame. 

All together I think the project was a good experience and I am satisfied with the result and how we worked together as a group. 

