/* Reflection

Name: Fiona Waters
Student Number: 20095357
Brief description of project:
Yarn Wars is a game where Angry Yarn Balls fall from the sky and you must shoot them with a Cannon in order to neutralise them before they reach the 
bottom of the screen/the ground. If you shoot one successfully you increase your score by 1. If an Angry Yarn Ball reaches the bottom of the screen, you lose a 
life. If your score reaches 10 the speed of the Angry Yarn Balls increases. There are sheep clouds floating across the screen, they display the current game, 
the score and how many lives have been used up. The default setup has 3 battles with 5 lives per battle. The right and left arrows 
on your keyboard control movement of the cannon across the x-axis. The control (ctrl) key controls the bullets. Pressing it once will shoot 1 bullet.
When you run the program a dialog box will appear asking the player to choose a difficulty level (this determines the number of Angry Yarn Balls in an 
array).Once this step is complete another dialog box will appear with instructions for the game, it also asks the player to enter their name and click 
OK to start the game.
After each Battle a dialog box will show the player their score, they will be prompted to click OK to continue to the next Battle. After all Battles
are complete a dialog box with scores will appear. The game is over.


Link to Video on YouTube:                https://youtu.be/ZKiysY__s7s

Part A - Mark (11 /11)
-----------------------------

Includsion of completed:
- Readme             (1)
- Reflection        (5)
- Video            (5)

<just a mark needed here>

Part B - Mark (4 /4)
-----------------------------

Comments, 
- indentation, 
- naming, 
- structure of code.

<just a mark needed here>


Part C - Mark (5 /5)
-----------------------------
Use of if and loop statements:

If statements used on line 68 - if statement allowing text to be shown on the screen depending on the value of a variable
 
 line 85-114 - If statement with nested for loop and containing 3 other if statements
 line 85 - to validate if the lives lost is less than the total lives
 line 87 - 114 drawing and updating the army, checking if a life is lost, updating variable and resetting
 army. 
 line 98 - livesLost is == total lives- Else - Adding score and updating a variable. 
 line 101 - Starting the next battle if there are more to be played, showing a dialog box and if user clicks OK resetting the game and 
 adding to no. of battles. Otherwise ending the game.
 
 line 119-125 - while loop drawing and moving flock of Sheep Clouds
 
 line 131 - 140 - while loop with nested if drawing and displaying the bullet if the boolean variable is true.
 
 line 149 - nested if and for loop increasing score variable if hitTarget()method returns true,when score=10 increasing
 speed of YarnBalls and showing text on screen.

line 169-199 - nested if statements with nested for loop used for key handler

line 212-231 - nested for loop with nested if statements used in hitTarget method for collision detection

line 249 - while loop used to set up yarn army

line 263 - do while loop used to set up bullets

line 278 - do while loop used to set up sheep flock
 
Lots of if statments used, examples of for loops, while loops and do while loops. Recording a mark of 5/5

Part D - Mark (10 /10)
-----------------------------
Working Game with inclusion of bespoke methods in the main sketch.

bespoke method:
void keyPressed() on line 166 used for key handler
boolean hitTarget() on line 210 to calculate collision detection.
void setupYarnArmy() on line 241 to set up yarn army
void setupBullets() on line 261 to set up bullets
void setupSheepFlock() on line 276 to set up sheep flock
void resetGame() on line 290 resetting the game values
void warOver() on line 301 displaying score table and then exiting the game

Working game with 7 bespoke methods in main sketch, working key handler, collision detection and avoidance
with scoring, lives, new game that resets correctly and high score table. Recording a mark of 10/10
-----------------------------
Part E USER DEFINED CLASSES
-----------------------------

Part E1 - Mark (9 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

Class named Bullet
line 3-6 fields
line 8 default constructor
line 15 overloaded constructor with no return, taking in 3 parameters
line 51- 69 Getter methods
line 72- 93 Setter methods

Class named Cannon
line 3-9 fields
line 11 default constructor
line 23-57 Getter methods
line 60-128 Setter methods

Class named Sheep
line 3-7 fields
line 9 default constructor
line 21 overloaded constructor with no return taking in 1 parameter
line 32-55 Getter methods
line 58-97 Setter methods

Class named YarnBall
line 3-6 fields
line 9 default constructor
line 20 overloaded constructor with no return taking in 3 parameters
line 29-48 Getter methods
line 52-83 Setter methods

4 user defined classes with fields, constructors, getters and setters. Access modifiers included on all.
3 Overloaded constructors included. Recording a mark of 9/10 as the Cannon class does not have an overloaded constructor
as I felt it was not necessary.

Part E2 - Mark (8 /10)
-----------------------------

Class bespoke methods:

Bullet Class
display() on line 32
move() on line 41
resetBullet() on line 97

Cannon Class
display() on line 133
moveCannon() on line 149

Player Class 
bulletAccuracy() on line 135
bulletFired() on line 145

Sheep Class
drawSheepCloud() on line 102
move() on line 133
resetSheep() on line 146 - private helper method

YarnBall Class
drawAngryYarn() on line 87
update() on line 115
reachedBottom() on line 124
resetYarnBall() on line 138

...

Methods with no return values:

display() on line 32 of Bullet Class
move() on line 41 of Bullet Class
resetBullet() on line 97 of Bullet Class

display() on line 133 of Cannon Class

bulletAccuracy() on line 135 of Player Class
bulletFired() on line 145 of Player Class

drawSheepCloud() on line 102 of Sheep Class
move() on line 133 of Sheep Class
resetSheep() on line 146 of Sheep Class

drawAngryYarn() on line 87 of YarnBall Class
update() on line 115 of YarnBall Class
resetYarnBall() on line 138 of YarnBall Class

Methods with values:
reachedBottom() on line 124 of YarnBall Class

Methods with parameters:
moveCannon() on line 149 of Cannon Class

14 bespoke methods created, 12 without return or parameters, 1 with return and 1 with parameters.
No overloading. I am recording a mark of 8/10

Part E3 - Mark (9 /10)
-----------------------------

- The user-defined class(es) are used in an appropriate manner 

multiple declarations of user defined classes:

Bullet Class - where used in main program
line 18 to declare
line 40 to initialise
line 134,214 and 188 use of getActive() getter method
line 136 use of display() method
line 137 use of move() method
line 190-193,and 224 use of setter methods
line 218 use of getY() getter method
line 219 use of getX() getter method
line 220 use of getDiameter() getter method
line 266 use of overloaded constructor

Cannon Class - where used in main program
line 17 to declare
line 39 to initialise calling default constructor
line 61 use of display() method
line 173 and 176 use of moveCannon() method
line 191, 192 and 266 use of getXCoord3() getter method

Player Class - where used in main program
line 21 to declare
line 45 to initialise
line 195 use of bulletFired() method
line 310 use of bulletAccuracy() method 

Sheep Class - where used in main program
line 20 to declare
line 43 to initialise
line 122 use of drawSheepCloud() method
line 123 use of move() method
line 281 use of overloaded constructor

YarnBall Class
line 19 to declare
line 42 to initialise
line 89 use of drawAngryYarn() method
line 90 use of update() method
line 92 use of reachedBottom() method
line 95 use of resetYarnBall() method
line 156 use of setDropSpeedY() setter method
line 218 use of getYarnY() getter method
line 219 use of getYarnX() getter method
line 220 use of getYarnWidth() getter method
line 225 use of resetYarnBall() method
line 251 use of default constructor

Many examples provided highlighting declaration, initialisation, use of getters and setters,
2 examples of use of overloaded constructors. 4 user defined classes plus some changes made to
player class. Recording a mark of 9/10

------------------------
PART F - DATA STRUCTURES
------------------------

Part F1 - Mark (15 /20)
-----------------------------
- Use of a data structure to store information i.e. array

Bullet [] magazine
delared on line 18
initialised on line 40
used on line 134,136,137,188,190-193,214,218-220,224,266
With the bullet array - after each bullet is initialised its boolean field active
is set to false. Inside the keyPressed() method a check is completed so that only
one bullet is shown on the output window when the ctrl key is pressed. This is done
by checking for active bullets in the array and making inactive bullets active, one 
at a time with the getActive() and setActive() getter and setter methods.

Sheep [] flock
declared on line 20
initialised on line 43
used on line 122-123

YarnBall [] army
declared on line 19
initialised on line 42 using user input to determine number of YarnBalls in army
used on line 89-90,92,95,156,218-220,225,243-251,

3 object arrays used in main program. 1 array size specified by user using JOptionPane
with value (name) of player also filled using JOptionPane. Recording a mark of 15/20.

Part F2 - Mark (20 /20)
-----------------------------
- Calculations performed on the information stored

Bullet [] magazine
line 132 elements in the array are checked as part of a loop using .length
line 134 compared to criteria
line 136, 137 elements in the array are updated
line 186 elements in the array are checked as part of a loop using .length
line 188 compared to criteria
line 190-193 elements in the array are updated
line 212 elements in the array are checked as part of a loop using.length
line 214 compared to criteria
line 224 elements in the array are updated

Sheep [] flock
line 120 elements in the array are checked as part of a loop using .length
line 122,123 elements in the array are updated

YarnBall [] army
line 87 elements in the array are checked as part of a loop using .length
line 89,90 elements in the array are updated
line 92 compared to criteria
line 95 elements in the array are updated
line 154 elements in the array are checked as part of a loop using .length
line 156 elements in the array are updated
line 216 elements in the array are checked as part of a loop using .length
line 222 compared to criteria
line 225 elements in the array are updated
line 249 elements in the array are checked as part of a loop using .length
line 251 elements in the array are updated 

Each array has elements checked using .length, compared to criteria and updated.
Recording a mark of 20/20
...
Recording a total mark of 91/100

FINAL CHECK:
I have checked the constraints and I am not breaking any constraints.

*/
