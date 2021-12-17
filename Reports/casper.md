### Score weighting
|Description | my weight |
|----|----|
|Gameplay video | 10 |
|Code video | 5 |
|Good Code  | 10 |
|Bad Code | 20 |
|Development process | 20 |
|Reflection | 25 |

### Bad code
Code that is wrote and consider bad or could be better is the vending machine script that handles the spawning of items. It had 3 functions that are more or less the same and could be redused to one with fewer lines. 

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/casper_vending.PNG?raw=true)

Another code example i find bad is the implementation of zombie spawning. The code is okay for the scale of this project but, it’s not very scalable for bigger project and would break if we had done the procedural generated maps we had planed. The spawning is hardcoded to check a variable if zombies have already been spawned on the map. The maps also need the enemySpawn to be set manually, which again adds more work that could been done through scripts.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/casper_zSpawn.PNG?raw=true)

### Good code
Although I didn’t write a lot of code, I am happy with the code that I did write. The vending machine does what it’s supposed to do, using as little resources as possible while being simple to read and understand. 

The first script is applied to the vending machine inside the world. It uses Godot’s signaling system to check if the player is inside the shopping area and if the interact button is pressed.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/casper_vending_check.PNG?raw=true)

The second script is used ones the user has opened the shopping UI and spawns items when pressed.

![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/casper_vending.PNG?raw=true)

### Reflection
Going in to this class i had already done a lot of group work but nothing as well organized as this. With the two meetings each week we were able to asign tasks, merge and discuss any issues we encountered or that might become a problem down the road. 
I feel that the trunk-based development approach worked well for us and i got to learn how git branches worked and how to handle merge conflicts, which i had never done before.

As you can see, i didn't do too much code. In the beginning we needed some testing maps to play around with and i said i could do that. The problem here was that now i was the one who knew how to make maps efficiently and so this became my main task for the rest for the project. I made all the maps as well as many maps that were intended for the procedural generated maps. This meant that when the course was coming to an end I was left with no code and suddenly had to make some for my grade. That said, i am happy with the vending machine.
So, if I could go back, I probably would have liked to forget about the whole puppy role and been more assertive. The whole six animal thing could probably work better professionally but in uni context probably not so much.

In the beginning of the course, we were asked what engine we wanted to work with and i chose Unity and Unreal. To this day i still belive Unity would have been the better engine for this 2D game. Godot is a less used so there's less help to find online and Unity's asset store could probably helped finding assets. That said im happy to say that i have tried Godot and knows how the IDE workes and can use it for small projects in the future if needed.

Another thing that i have learned is that things take a lot of time. Implementing a big feature isn't something that is done overnight. 
One thing is coming up with it and coding it. another thing is to fix bugs and make sure nothing is broken. So, i feel more confident in planing how much effort is needed for different tasks in game programming. 

One last thing that i found fascinating is how psychology plays a big role for how we can predict who our main player base is and how different we as developers are. Being able to tell that the player base will be made up of a majority if teens, just from looking at how many decisions the player has to make, sound very interesting. Also, the fact that we as programmers are different i find fascinating. With the example of the pony game and how just from which county you are from can tell something about your ethical perspective. Americans not seeing an issue with microtransaction while Norwegians favor a system with a max limit to money spent.


