### Score weighting TBD
|Description | min | def | max |
|----|----|----|----|
|Gameplay video | 5 | 10 | 20 |
|Code video | 0 | 10 | 15 |
|Good Code  | 10 | 20 | 30 |
|Bad Code | 10 | 20 | 30 |
|Development process | 10 | 20 | 30 |
|Reflection | 10 | 20 | 30 |

|Description | my weight |
|----|----|
|Gameplay video | 10 |
|Code video | 0 |
|Good Code  | 20 |
|Bad Code | 25 |
|Development process | 15 |
|Reflection | 30 |


### Bad code
For my bad code example, I want to use the way I implemented the minimap in the UI. Now overall I'm very happy with how it looks, with the frame (borrowed from Terraria) and all, but there are specifically two shortcuts I made when coding this minimap that I want to pull forward as bad code I wrote.

The first is about the placement. The ideal implementation here would be for the minimap to stick to the bottom right corner, and move dynamically as the window is resized - ideally even scale in size based on total width/height, but at the very least moving to fit in the corner. Instead what I did was hardcoding the position, meaning that if we wanted to change the resolution it would suddenly no longer be properly positioned.

The reason I did this was simple: when I first implemented the minimap, I wanted feedback from the group on whether it was even before going into the nitty-gritty of coding it properly. Then I started working on other features, and was in the middle of that when we did the review and the group approved the minimap implementation. I figured again that I would get back to fixing the placement code, and it just...kinda never happened. Since we did not implement multiple resolutions for our game in the end, it never even really came up again. This is definitely something I would have liked to improve about my code in the project.

The second part of the minimap I want to touch on is a little more interesting - how it is built up. The basic functionality is fairly simple - the 'base' minimap has the center room and no exits. The exits are applied on top of the minimap based on an array of four bools representing the cardinal directions, which is held in a separate minimap node for each map scene we add to the game. The bad thing about this: after adding the node to the scene, we then have to manually set which directions (N/W/S/E) contains exits by flipping the respective bool in the array to true.

The reason this is bad is not just because of the extra work - if we had, as initially considered, been able to implement prodecurally generated maps (which seems a natural development for our style of game) then this would straight up not work. So how would I fix this?

After thinking about it a bit, I figured I would use an algorithm to take care of the exit placements on the minimap. The basic functionality would be like this:

* Get the four (x,y) coordinates defining the borders of the map. In the case of T-shaped maps and the like, this would still work since finding the most extreme y-value would be found first first, and then I would use the largest/smallest values of x for that value of y. This then defines the boundaries of my map.
* Split the map into four quadrants like an X to determine which parts of the map are N,W,S,E
* Find the position of all portal nodes connected to the map
* Compare their positions with my quadrants.
* Set all quadrants that are found to contain a portal to 'true' in my array.

In the end, this was again not a priority for the project, which is why I did not implement it.

### Good code
The first thing I want to mention is, actually, an aspect of my minimap which I already derided as bad! That is my solution to placing the minimap. This will not be a primary example of bad code, but the reason I want to bring it up is because it utilizes a fairly important concept in software development: Keep It Simple. My solutions does not scale well and would not work if we developed the mapping a lot further, true...but it was a quite elegant and efficient solution for our project, which allowed me to implement the minimap without much extra work. And although technically setting the exits on each scene is extra work...it just did not take much time at all with only a few dozen map scenes overall. In other words, I will defend it as a very solid and clever solution GIVEN the scope of the project! Hopefully it's not cheating to use it in both sections.

*** Write more about good code here ***

### Reflection
Overall, I had a lot of fun working with this project. I think I learned a lot during it - about designing games, coding games, working in a team, working with Godot, and what kind of unforeseen and unpredictable issues that can crop up during the game development process. There were things about the work that I thought would be harder before I started, like the basic usage of the IDE, or certain engine features like using layers and general hit-detection. And there were things I underestimated or even didn't consider at all, like the importance of audio and how it's implemented, or how hard it would be to design a decent game in the first place.

As mentioned briefly in the group report, I think Godot was a good choice for our game, but I wish I had been able to work in Unity or Unreal instead. I have some regrets about making a fully 2D game, even if I feel fairly confident that the end result is more polished and feature-rich than what we could have made in 3D.

Two of the most important things I learned during the course was the importance of solid communication and consideration for future development. Once interesting consequence of the fact that none of us had worked with Godot or general game-creation before, was a fairly hefty amount of refactoring done to improve implementations. And even so, there was still much more we could have kept refactoring, or implemented more cleanly in the first place. One example here is the inheriting class feature, which to be fair we should even have thought of from the start since it is hardly unique to game development. But since we started working separately on related features, we had to take passes to perform these kinds of refactors. One example here is the 'actor' class - initially, two of us worked separately on *player* and *zombie*, but of course we eventually (though thankfully fairly early in the project) realized that we should combine these together, and we have our current system where *player* and *enemy* inherit from *actor*, and all the various zombie variants inherit from *enemy*. We had similar issue with the implementation of explosions as a part of the *frag grenade* which them meant I had to refactor the code to separate this implementation from the grenade code entirely. With proper planning and better communication about what and how was to be implemented within the group, most of this could have been implemented from the start, saving us a lot of work.

I learned a lot about how to work with Godot, and the ins and outs of its system. I was fairly impressed with its nodes and signals setup, but also ran into some frustration over wanting signals that were not implemented by default. Working with its scripting language was in turn easy and fast, or frustratingly limiting, but overall I believe it definitely sped up the work. The debugger was fairly powerful and easy to use, and always gave very clear and easy to understand errors, which was very nice.

Another good lesson was the worth in keeping fresh code isolated until ready to implement in main. Our group used trunk-based development meaning we all had our own branch we worked on, and only one person was working on each branch at a time. This REALLY saved us a lot of time on merge conflicts and similar, and we still had to spend a good amount of time on this. The importance of project management and making sure we double- and triple-checked things worked really was hammered in during this project - for larger merges/pull-requests we would typically even do it as a group over discord with the merger streaming and getting feedback.

Finally, I learned how difficult it really is to design a game. Even though I'm very happy with the functionality and features of our final product, there are still so many things about the basic design and gameplay that I would want to change or improve. Some of those things are very tangible - I would have liked a good amount more zombies with perhaps less hitpoints (though I was overruled on the former in the group) to make it scarier and the gameplay more engaging for example. Others are tougher to pin down and define exactly how to fix - some sense of progression system beyond our limited experience implementation, or better movement. For the latter, messing with the physics would likely help, but pinning down exactly the best and most balanced solution was super hard.

Overall I'm very happy with my work on the project, what I learned, and how the group functioned.
