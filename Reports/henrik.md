### Score weighting
|Description | my weight |
|----|----|
|Gameplay video | 10 |
|Code video | 0 |
|Good Code  | 25 |
|Bad Code | 20 |
|Development process | 20 |
|Reflection | 25 |

### Good Code

### Bad Code
One part of my code which I concider very bad is the calculation of high score. This has partly to do with the time I spent on it and the group collective idea that this aspect of the game should not be prioritized, but needs to be included in the final result. We wanted players to get a score when they die, and when they win the game. The score calculation per now is the amount of experience (XP) you have gathered divided on the total playing time. The image of the code can be seen below.
![](https://github.com/sindre0830/YAZG/blob/main/Reports/Images/henrik_XP_bad.PNG?raw=true)
There are some problems with this code and maybe the biggest is that the calculation is similar when you die and when you win. If given more time I would probably use the difficulty also as a factor to calculate the score. To illustrate the proble I have created this scheeme:

|nr | Time | XP | Score |
|----|----|----|----|
|1 | 10 | 100 | 10 |
|2 | 20 | 400 | 20 |
|3 | 30 | 200 | 6.67 |
|4 | 1000 | 5600 | 5.6 |
|5 | 1800 | 3900 | 2.17 |

As you can see from the table I think actually that the score is alright if it only was calculated when the player has succesfully finished the game, but it does not work well when players die at early stages while killing some zombies. Further improvements would include some kind of level check and multiplition factor based on how much progress you have made. Maybe also have a kind of logic to binding th emaximum value you could get as score fo each level one example of this is: level 1 = (0p-100p), level 2 = (100p-200p), ... level n = (p-p+100). where p is the max from the previous round.
efefe
 - Short game looses after killing 2-3 zombies
- Short game looses after killing 7-8 zombies
- Short game looses after killing 2-3 zombies
- Long game finished and gathered average XP with a good time
 - Long game finished, gathered low amount of XP and a long playing time

### What I learnt during the course
