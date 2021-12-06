# Group discussion
Group members: Sindre Eiklid, Casper Melhus, Henrik Karlsen, Rickard Loland, Niklas Menzel, Martin Araya

[Demo video](https://www.youtube.com/watch?v=TjqtJjdRRfI) - Showcases the game.

[Code video](https://www.youtube.com/watch?v=EwH23BpF348) - Showcases the *hidden* code.

[Game Design Document](https://github.com/sindre0830/YAZG/blob/main/gameprog.md) - This was a great way for us to plot down all of our ideas and define the vision of our product. However, after initially creating the document, we did not update it as much as we should have - while we went back to consult it several times, we only had one big update later on during the process. Ideally, we would have used this a bit more as a living document, and updated it as our plans and assumptions about the game changed.

### Individual report
- [Casper](Reports/casper.md)
- [Henrik](Reports/henrik.md)
- [Martin](Reports/martin.md)
- [Niklas](Reports/niklas.md)
- [Rickard](Reports/rickard.md)
- [Sindre](Reports/sindre.md)

### Work Distribution Matrix
| | Sindre | Casper | Henrik | Martin | Niklas | Rickard |
|----|----|----|----|----|----|----|
| Player | Most | Touched | Touched | Touched | Some | Touched |
| Zombies | Some | | Touched | | Touched | Most |
| Bosses | All | | Touched | | | Touched |
| Guns | Some | | | Most | | |
| Collectables | | | Some | | Most | |
| Throwables | | | | | Most | Some |
| UI | Some | Some | Some | Some | Some | Some |
| Maps | | Most | | Some | Some | |
| Audio | | Touched | Touched | All | Touched | |
| Breakables | | | All | | Touched | |

### Gameplay
The game is a top-down shooter with experience and difficulty increasing as you kill the enemies in the level. Each level has metal fences that will open when all the zombies of that level are defeated. The game features two guns and two throwables at the moment. With 4 types of zombies and 3 bosses. The enemies are randomly scattered on each map.

The UI of the game displays current health, experience, and difficulty. It also shows the equipped weapon and a minimap that can help the player orientate in the current map.

The guns have an internal ammo system that will reload the weapon when it’s empty, preventing infinite spam of bullets.

Moving backward is slower than moving forward. This was implemented to create a tradeoff in creating distance and dealing damage to the zombies. The player can still turn around and run from the zombies at full speed but can’t shoot at them at the same time.

Each zombie killed increases the difficulty, increasing health and damage of all other enemies in game.

The game has a score system based on experience accumulated and time spent in game, and it records the high score that the player has got each time.

### Game engine
We were considering which engine to use for a little while during the start of the course and ended up deciding on Godot because it seemed to be best suited for the kind of game we were making - a top-down 2D game. Compared to Unity and Unreal Engine, Godot is small and lightweight. This means that the general time from coding to result is short because of how fast it is to test, edit and open the project code. Where Unreal and Unity are both engines heavily designed around 3D, 2D game development stands more centrally for Godot. This is probably in part due to its status as a fully open-source and free engine, making it popular among people first learning how to make games. This meant that the UI and editor generally seemed cleaner and easier to use for our 2D game.

We found that Godot was interesting to work with, sometimes very easy and intuitive, at other times frustrating. Using Godot mostly meant working with either its scripting language GDScript or the game editor directly. The scripting language was quite easy to understand at its core, as it resembled Python quite a bit. The main challenge came from learning and understanding how to connect it to various features of Godot, such as signals and scenes. Additionally, Godot’s pathfinding implementation (specifically the A* algorithm) in version 3.3.3 which we were using, did not work properly - apparently, this is slated to be fixed with the next update to Godot, but that did not come in time for our game. The issue mostly manifests as occasional lag if zombies get stuck, but we have not experienced much of this during our testing for release.

While GDScript was easy to pick up, we would run into problems when wanting to do complex tasks. We were limited to their implementations and could not easily create our own versions. For instance, the A* algorithm created by Godot that as mentioned was broken turned out to be tough to fix manually since most of the internal functionality was hidden in the scripting language. In general, working with GDScript meant that we had easy ‘guides’ to follow and quickly implement features supported by the script, but if we wanted to go off-script as it were due to bugs or missing features it instead became quite limiting.

The game editor was similarly often fairly convenient and easy - it allows you to create a new object from a series of templates (such as area2D, sprite, or canvas2D) and allows you to directly tweak parameters for transformation, collision layers, scale, and much, much more for these objects. In addition, it contains the mentioned signaling system, which is a very interesting system for connecting different objects together and automatically constructing functions to handle this interaction based on various predefined conditions, such as ‘on_body_entered’, or ‘on_timeout’.

Overall, we think Godot was a good choice of an editor for our game, as it was simple enough to start using immediately, but had enough different bells and whistles to keep us learning new things about how to use it throughout the project. It allowed us to focus on designing and creating the game itself more than wrangling and wrestling with our toolset - though certainly some of that featured in our experiences as well!

Despite all this, some of us still somewhat regret picking Godot for this project. There were a few reasons for this. First, the more we used the Godot engine, the more we felt that the practical coding side of our learning outcome was not very easily transferable to other game engines due to development being heavily focused on its scripting language. We also felt that we got little out of most of the course lectures that did not focus on broader concepts like game design or testing - specifically coding-focused lectures centered on Unity. Finally, we thought that learning Unity or Unreal would likely be more useful to learn for potential future career options, or just generally continuing to work with games.

### Teamwork
At the start of the group project, we created a contract, linked on the [wiki](https://github.com/sindre0830/YAZG/wiki/Contract), that stated the following:

* Group meetings at least twice a week
* Tuesday meetings will focus on project management
* Friday meetings will focus on coding
* If a team member has low attendance over several weeks, we have a group discussion about it
* Team-members should work individually for at least 3 hours each week

We were able to follow these guidelines very well and didn’t have any issues with low attendance. As for the schedule, we had meetings every Tuesday from 8:15 to 10:00 where we dealt with merging issues and assigned tasks so every group member had something to work on, and Friday from 8:15 to 10:00 we coded together on Discord and could help each other with any coding problems. We continued the meeting on Friday after the lecture which allowed the teachers to jump in to help out with any questions that we had.

During the start of this course, we were assigned roles that would decide how we should proceed in the project. We didn’t find these roles to be that important and quickly decided to work as equals since everyone would take the initiative during meetings. This worked well since we were a small group, but if we were to have more group members we would need to use the roles.

We have had a code review process ongoing since the start of the project. Every Friday started off with a session where everyone got the chance to display their code, this was an opportunity to show their progress, get help with some bugs, or just check if the code looked great and up to the project standards. These meetings were done online because we found screen share on discord to be the platform where most code would be reviewed the fastest. Even though this was our preferred method, we also tried Visual Studio Code *Live Share* extension and to meet in person, but those methods of code review did not prove beneficial compared to screen sharing. *Live Share* was laggy, and it was hard to display and review the actual code when meeting in person. Using Discord screen share felt a lot more productive, even with only one person coding.

### Version control system
From the start on it was clear for us that we would use git for version control. We decided to share our code via GitHub as it also allows us to keep track of issues. For [issue tracking](https://github.com/sindre0830/YAZG/projects/10), we created tickets in GitHub and assigned them to us when we were working on them. In commit messages, we mentioned the number of the ticket in order to make GitHub link commits with related issues. This allowed us to keep track of how certain issues have been solved. 

We used a [Trunk Based Development](https://trunkbaseddevelopment.com/) strategy for this project. Instead of doing the usual *dev* branch, we keep the main branch active and create branches for each issue, and merge them with the main branch when the issue was finished. This reduced merge conflicts and let us spend more time on actual coding.

We labeled each ticket with either *high priority*, *medium priority*, or *low priority*, which reflects the importance of the task. We decided to focus on the issues that were of high importance, this allowed us to implement all of the important features first and get a working product quite early in the development process. During the end of the development process, we could see that some of the issues were out of scope and we would label them as *wontfix*. This made it easier to see which issues were still relevant during the last few weeks of development.

In order to keep a good overview as the number of tickets increased we decided to implement a way of sorting our tickets. First, we created different categories in which we would sort each ticket. The categories ranged from quite specific like *AI* which included all zombie AI-related tickets to very general categories like *Bugs*. 

We also sorted the tickets in each category by their priority. As soon as we closed a ticket we moved it to the bottom of the category so that only the most urgent unresolved tickets are well visible on the top. This allowed us to keep a good overview on which parts of the game needed the most work at any given moment.
