# Individual Report - Sindre Eiklid
## Score weighting
|Description | Weight |
|----|----|
|Gameplay video | 10 |
|Code video | 0 |
|Good Code  | 20 |
|Bad Code | 20 |
|Development process | 25 |
|Reflection | 25 |

## Good Code
A contribution that I consider good is the way I handle the enemy state. It is handled through a variable that keeps the enum value of either IDLE, WANDER, or CHASE.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/zombie_physics_process_full.PNG)

*Function from the [Zombie.gd](../Source/Actor/Zombie/Zombie.gd) script. Line 39 is cut off because of the length.*

When generation a basic zombie, the state starts as IDLE. This state generates a random position within an acceptable range, then sets the state as WANDER. The WANDER state generates a path from the current position of the enemy to the target position which was generated in the IDLE state. Then it moves according to the path generated until it reaches the end or collides along the way. Then it sets the state to IDLE again to get a new position. The last state, CHASE, is only triggered when the player enters/exits the vision of the enemy.

Once a player enters the vision area of an enemy, it sends a signal to the script, which is then used to set the state as CHASE. In this state, the enemy sets the target path to the player position instead of a random one. Then it performs the same functions as WANDER by getting the path to the player, then moving along that path. When the player moves out of the zombie vision, a new signal is sent and the state is set back to WANDER.

Most enemies use a variation of this system except for the boss, which I'm also quite happy with. The boss is constantly chasing, but at different levels. It has a mode variable instead, which keeps the enum value of either NORMAL, INSANE, or SPRINT. These modify the speed and are triggered by timers and health.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/boss_physics_process_full.PNG)

*Function from the [Boss.gd](../Source/Actor/Zombie/Boss.gd) script. Line 41 is cut off because of the length.*

INSANE mode is applied when the boss health is below 50%, this mimics anger and makes it a lot harder to finish the boss. SPRINT is applied at an interval every 8 seconds and lasts for 4 seconds. This makes the boss fight less repetitive.

The way I implemented both the state for the zombie and the mode for the boss makes it very easy to add, remove, or modify.

## Bad Code
I consider the way I handled enemy navigation to be a bad implementation. First, I'll start with a bit of background then I'll discuss why this is a bad implementation and suggest some other solutions that could be better.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/getNextPosition.PNG)

*Function from the [Enemy.gd](../Source/Actor/Enemy.gd) script.*

The navigation function, get_simple_path(), is provided by Godot through the navigation module added to each enemy. We simply marked all the tiles in the tileset with a navigation mesh then I could call on that function to get a path from A to B through those tiles. Since both A and B coordinates are a part of the list, I check if any new positions have been added with a simple if statement that checks if there are more than 2 coordinates. Then I either send an empty vector, which translates to the player positions, or the next position. While this was fairly simple, there were some problems with this solution.

First of all, the function doesn't give the most optimal route, as stated by the official [Godot documentation](https://docs.godotengine.org/en/stable/classes/class_navigation.html), and won't be fixed until the release of Godot 4.0. This isn't that big of a deal since it only affects the time it takes the enemy to get to the destination. I don't consider this issue to be my fault, given how it is acknowledged in the Godot documentation. The other problem I had was the fact that it is a very expensive function to call.

When we first noticed the lag spikes and low framerate, we didn't know what caused it. Luckily we had learned about game engine debugging in one of the lectures and used the debugging tool, profiler, provided by the Godot engine. This showed which function would be called during the low framerate and quickly showed us that the getNextPosition() function was the culprit. I was calling the function every tick for each enemy. This would make the game very slow and eventually unplayable the more enemies there are on a map. It was clear that the only way to fix this issue was to reduce the number of times I would call this expensive function.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/zombie_physics_process.PNG)

*Part of the _physics_process() function from the [Zombie.gd](../Source/Actor/Zombie/Zombie.gd) script. Added new lines to capture the entire code snippet.*

A solution I came up with was to call it every second instead of each tick, but this would cause lag spikes when all the enemies called the function at the same time. The final solution I came up with was to only call the function when necessary. This meant that the enemy would only call the function if it collided, otherwise it would just move towards the player. This is the solution that is implemented at the moment, and while it reduced the lag spikes, it didn't fix the issue. A big problem with simple scripting languages like GDscript is that we are forced to use their solution, and not able to do many advanced implementations ourselves. This is the case with the navigation function.

Since the function provides coordinates at the very edge of the allowed area, the zombie will end up colliding with the wall before arriving at the coordinates. I.e. it calls the navigation function, collides, then calls it again in a loop. This is especially true with some of the maps that have corners and one of the zombies ends up at the edge while targeting the player. This wasn't that big of a deal when we only had the normal zombies, who stop chasing the player once it lost vision, but it became a big issue once the new zombies were added. One of the new zombies is always targeting the player, so if the player moves behind a wall or around a corner, the enemy will *hug* the wall and end up losing frames.

While writing this, I've come up with some new solutions to fix this issue. The very first solution, calling the function on a timer, could work if I had randomized the timeout so that the enemies would not call the function at the same time, but rather at different times spreading the expensive calls. Another solution that could work would be to create a custom version of the A* algorithm. The reason I couldn't have done this during the development process was that I had a lot of other things to implement and didn't have time to perfect enemy navigation when the solution I ended up with worked well enough.

When it comes to the code quality, I think I could have made the large if statement in the code snippet above more readable. I've read Clean Code by Robert C. Martin, and one of his suggestions is to reduce large complex if statements into multiple variables with names according to their use case.

```Kotlin
var flagCollided = collided && collided.collider != null
var flagNotEnemy = !("Zombie" in collided.collider.name || "Boss" in collided.collider.name)
var flagOutsideRange = (path - global_position).length() > CHASE_TOLERANCE
if flagCollided && flagNotEnemy && flagOutsideRange:
    // rest of code...
```

This code snippet is a lot more readable and reduces the amount of time another person has to spend trying to understand the use case of the if statement. Other than that, I don't think there is much I could have done to increase the code quality. This is one of the benefits when coding in simple scripting languages like GDscript.

## Reflection
I've learned a lot about game development and remote teamwork in this course.

For this project, we chose Godot as our game engine. While we discuss the downside of picking this engine in the group discussion document, I think we still learned the fundamentals of game engines and can easily translate a lot of our knowledge gained from Godot to other engines. For instance, the debugging tools provided by Godot are similar to other engines and would require little to no competence acquisition. The same goes for the scripting language provided by Godot, while GDscript is unique to Godot, all engines have an API to simplify advanced graphics functions. Throughout this course, we have had to learn to read documentation, go through forums, and ask good questions to have a smooth and efficient development process.

During the start of the development process, we had a rather large scope in mind. I expected us to be a bit over scope since we never designed a game before, but didn't expect to hit this many roadblocks and have to reduce the scope as much we ended up doing during the end of the development process. Through this course, I've learned that game development is a lot harder than I first thought it would be. My initial thought going into this course was that game development was mostly logic-based and that it would be quite easy to implement most of the features we wrote down at the start. In reality, we spent most of our time acquiring competence, reading old forums, going through the documentation, and watching old youtube tutorials to do simple things with the Godot API. This is where most of our time was spent and in hindsight, makes a lot of sense. If we were to start a new project with all of the competence acquisition we have now, regardless of engine, we could better estimate the scope within the deadline and the development process would be a lot cleaner and more efficient.

When it comes to testing, most of it was done through manual testing before merging with main. At the very start of this project, I looked for workflows that could automate some linting checks and game building but found none for Godot. This is one of the issues with picking an engine with the smallest community. There are also very few linting errors that could happen with simple scripting languages like GDscipt so this wasn't a big issue. Other than that, we learned that design tests, like wireframes, aren't as useful now compared to the past. This is because of how easy and fast it is to implement GUI through the editor provided by the game engines. Since we were told that we shouldn't focus on art/design, no design tests were done, and we ended up choosing the quickest solution so that we could spend more time implementing other features. During the middle of the development process, I performed a [code review](https://github.com/NTNU-IMT3603-PLATFORMER/NTNU-IMT3606-GAME/issues/72) of another group project and learned how to be both respectful and critical to others implementation. This is an important aspect of coding and is something I will take with me in my coding career.

While I've had remote teamwork before, this is the largest group project (in regards to coding) I've been a part of. It was interesting to see concepts like [Trunk Based Development](https://trunkbaseddevelopment.com/) strategy, Scrum, and GitHub/GitLab features like branching and issue tracking work so well in a large group setting. To manage this remotely was a very interesting experience for me, and while there were some issues, the positives outweigh the negatives. For instance, trying to show code to the group in person is a bit awkward, while remote work allows for screen sharing on discord. This made it easier for everyone in the group to engage and allowed for more feedback. Since we had coding sessions where we could help each other with any coding problems that might occur, I quickly learned to both give and receive criticism in a respectful, but concise matter. This is very important when working in groups, and is especially important in a business setting.

Overall, I would say that this was a successful project and I found the course to be both fun and informative. 
