/*Name: Fiona Waters
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
 */
import javax.swing.JOptionPane; 

Cannon cannon; 
Bullet[] magazine;  
YarnBall[] army; 
Sheep[] flock; 
Player player; 

int livesLost = 0; 
int score = 0;
int totalLives = 5;
int battlesFought = 0; 
int battle = 1;
int totalBattles = 3; 
int showMessage = 0; //variable allowing for a message to be shown on screen

/*
  setup function setting size of output window, allowing for setup of the game.
 */
void setup ()
{
  size(1280, 720); 
  noCursor();

  cannon = new Cannon(); 
  magazine = new Bullet[100]; 
  //initialising a new Yarnball object array called army with parameters passed in by the user using JOptionPane
  army = new YarnBall[Integer.parseInt(JOptionPane.showInputDialog("Welcome to Yarn Wars! Please choose your difficulty level \nEasy - 5 \n Intermediate - 7 \n Expert - 10\n", "5"))];
  flock = new Sheep[3]; 
  //initialising a new Player object, calling overloaded constructor method, giving game instructions and taking in the players name using JOptionPane
  player = new Player(JOptionPane.showInputDialog("Shoot as many Evil Yarn Balls as you can using the ctrl button.\n\n" + "Control the Cannon using your right and left arrows. Press and hold arrows to move faster.\n\n" +
    "Please enter your name below, then click OK to START!"), totalBattles); 

  setupBullets(); //calling a method with starting values for the Bullet class
  setupYarnArmy(); // calling a method with starting values for the Yarn object army array
  setupSheepFlock(); //calling a method with starting values for the Sheep object flock array
}

/* 
 draw function executes code repeatedly - 60 times per second 
 */
void draw()
{
  background(109, 178, 248); 
  fill(83, 194, 52); 
  rect(0, 576, width, height/5); 
  cannon.display(); // calling display method from Cannon class which displays the cannon object in the output window

  /*
showMessage global variable is set to 0 initially but is increased to 240 after the player has reached a score of 10, this displays the text below 
   on the top left corner of the display window for 4 seconds (60 frames per second by 4 = 240). An if statement is used so that the text is 
   only displayed when the variable value is greater than 0. Which coincides with the increase of the falling YarnBall speed.
   */
  if (showMessage > 0)
  {
    textSize(50); 
    text("FASTER...faster!!", 0, 50); 
    showMessage--; 
    //decrease the showMessage variable 60 times per second until it reaches 0 - i.e. for 4 seconds. When it reaches 0 the message is no longer displayed.
  }

  /*
  if the player has more than 1 life left in the current battle, for each index in the array corresponding to the value of i, until the size of the array is reached;
   call the drawAngryYarn method from the YarnBall class, and the update method from the YarnBall class. I.E. draw x number of YarnBalls and update their position.
   If the reachedBottom method from the YarnBall class returns true; increase the number of livesLost variable by 1 and call the resetYarnBall method from the YarnBall class.
   If the player has no lives left, call the addScore method from the player class increase the battlesFought variable by 1. If the number of battlesFought is now less than
   the totalBattles show a dialog box(JOptionPane) confirming that a battle is complete, show the player their score and ask them to click OK to continue to the next Battle.
   If the OK button is clicked call the resetGame function to reset the game and increase the battle number by 1. If the livesLost variable is = totalLives OR if the player
   closes the dialog box call warOver function.
   */
  if (livesLost < totalLives) 
  {    
    for (int i=0; i<army.length; i++)
    {
      army[i].drawAngryYarn();
      army[i].update();

      if (army[i].reachedBottom() == true)
      { 
        livesLost++;
        army[i].resetYarnBall();
      }
    }
  } else {
    player.addScore(score);
    battlesFought++;
    if (battlesFought < totalBattles)
    {
      int startNextBattle = JOptionPane.showConfirmDialog(null, "Battle complete! You scored: " + score + "\n" + "Click OK to play your next Battle!", "Battle Complete", 
        JOptionPane.OK_CANCEL_OPTION);
      if (startNextBattle == JOptionPane.OK_OPTION)
      {
        resetGame();
        battle++;
      }
    } else
    {
      warOver();
    }
  }
  /*
while the variable k is less than the size of the array called flock call the drawSheepCloud function and then the move function from the Sheep class. Increase
   the variable k by 1. This draws 3 Sheep Clouds at random between certain y axis parameters, they move at random speeds across the screen(sky).
   */
  int k = 0;
  while (k<flock.length)
  {
    flock[k].drawSheepCloud();
    flock[k].move();
    k++;
  }
  /*
while the variable i is less than the size of the array called magazine and if the getActive method of the Bullet class returns true; call the display and move
   methods of the bullet class. increase i by 1.
   */

  int i = 0;
  while (i<magazine.length)
  {
    if (magazine[i].getActive() == true)
    {
      magazine[i].display();
      magazine[i].move();
    } 
    i++;
  }
  /*
setting boolean variable to hitTarget method return value. If the method returns true increase the score by 1, If the score is equal to 10, set
   the showMessage variable to 240 (which will display a message for 4 seconds) and call the setDropSpeedY setter to increase the speed of each Yarn Ball
   in the array called army.
   */
  boolean collision = hitTarget();

  if (collision == true) 
  {
    score++;
    if (score == 10)
    {
      showMessage = 240; 
      for (int j=0; j<army.length; j++)
      {
        army[j].setDropSpeedY(random(1.5, 2.5));
      }
    }
  }
}
/* 
 method allowing for an action to take place once certain keyboard keys are pressed.
 if the right arrow is pressed call the moveCannon method from the Cannon class and change the x value by a specified integer, 10
 if the left arrow is pressed call the moveCannon method from the Cannon class and change the x value by a specified integer, -10
 */
void keyPressed()
{

  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      cannon.moveCannon(10);
    } else if (keyCode == LEFT)
    {
      cannon.moveCannon(-10);
    }
    /*
  if the control (ctrl) key is pressed set the boolean variable bulletFound to be false. For each instance in the magazine array call
     the getActive getter method - if this returns false and the bulletFound variable is false; call the setActive setter method and set to true, set the X+Y
     values for the active bullet to the top of the cannon using getter methods from the Cannon class and set the diameter of the bullet. Set the bulletFound variable to true and call the bulletFired method from the player class.
     */
    if (keyCode == CONTROL )
    {
      boolean bulletFound = false;
      for (int i=0; i<magazine.length; i++)
      {
        if (magazine[i].getActive() == false && bulletFound ==false)
        {
          magazine[i].setActive(true);
          magazine[i].setX(cannon.getXCoord3());
          magazine[i].setY(cannon.getYCoord3());
          magazine[i].setDiameter(20)  ;
          bulletFound = true;
          player.bulletFired();
        }
      }
    }
  }
}
/*
Method returning a boolean value determining if a bullet has come into contact(hit) a Yarn Ball.
 for each instance of the Bullet array called magazine call the getActive method; if it returns true - for each instance of the YarnBall array
 called army calculate the distance between the X and Y values of both objects using getter methods. If the distance between the Y coordinates is less than 
 or equal to the combined radius of the two objects, AND the distance between the X coordinates is less than or equal to the combined radius of the two objects
 call the setActive method of the Bullet object magazine array - setting it to false, and call the resetYarnBall method of the Yarnball object army array. This 
 makes the bullet and the Yarn Ball disappear from the screen. Return true for the method.
 If the objects don't collide, return false.
 */
boolean hitTarget()
{
  for (int i=0; i<magazine.length; i++)
  {
    if (magazine[i].getActive() == true)
    {
      for (int j=0; j<army.length; j++)
      {
        float distanceY = abs(army[j].getYarnY() - magazine[i].getY());
        float distanceX = abs(army[j].getYarnX() - magazine[i].getX());
        float combinedRadius = army[j].getYarnWidth()/2 + magazine[i].getDiameter()/2;

        if (distanceY <= combinedRadius && distanceX <= combinedRadius)
        {
          magazine[i].setActive(false);
          army[j].resetYarnBall();

          return true;
        }
      }
    }
  }
  return false;
}

/*
method with no return setting up the army array of YarnBalls. The number of YarnBalls is determined by the user when choosing difficulty level
 at the beginning of the game. Validation required to ensure that a certain number of YarnBalls (5) are drawn if the user chooses a number outside 
 of the prescribed levels.
 
 */
void setupYarnArmy()
{
  if (army.length<=0 || army.length>20)
  {
    army = new YarnBall[5];
  }

  int i = 0;
  while (i<army.length)
  {
    army[i] = new YarnBall();
    i++;
  }
}
/*
method with no return setting up and array of bullets called magazine with starting values. 
 Using do while loop and calling the overloaded constructor and setting coordinates
 of bullet as same as the top of the cannon.
 */

void setupBullets()
{
  int i=0;
  do
  {
    magazine[i] = new Bullet(cannon.getXCoord3(), cannon.getYCoord3(), 20); //calling overloaded constructor
    i++;
  }
  while (i<magazine.length);
}

/*
method with no return setting up an array of sheep called flock with starting values. Using a do while loop and calling an overloaded constructor
 to set the speed of the Sheep across the x axis using random.
 */
void setupSheepFlock()
{
  int i = 0;
  do
  {
    flock[i] = new Sheep(random(0.5, 2)); //calling overloaded constructor
    i++;
  }
  while (i<flock.length);
}

/*
method with no return setting all relevant variables to starting values at the start of each new Battle/game
 */
void resetGame()
{
  setupYarnArmy();
  setupBullets();
  livesLost = 0;
  score = 0;
}
/*
method with no return displaying a message dialog box with details of the players name, scores and some calculations on
 these scores. Methods called from Player class to calculate and display these.
 */
void warOver()
{

  JOptionPane.showMessageDialog(null, player.getPlayerName() + " , your WAR IS OVER! \n\n CONGRATULATIONS!\n"  
    + "\n" + player.toString()
    + "\n TOTAL SCORE: " + player.totalScore()
    + "\n Highest Score: " + player.highestScore()
    + "\n Lowest Score:  " + player.lowestScore()
    + "\n Average Score:  " + player.averageScore()
    + "\n  Bullet Accuracy: " + player.bulletAccuracy() +"%"); 

  exit(); //exit the game/program
}
