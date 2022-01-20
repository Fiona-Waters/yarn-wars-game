public class Player //class for player object - derived from the Pong Game player class
{

  private String playerName; 
  private int[] results; 
  //no getters and setters created for variables numBattles or bulletsFired as they are used only in the Player Class. 
  private int numBattles; 
  private int bulletsFired;

  public Player()//default constructor
  {
  }
  /*
  overloaded constructor method taking in 2 parameters and setting default values
   */
  public Player(String playerName, int numBattles) 
  {
    this.playerName = playerName;
    results = new int [numBattles];
    numBattles = 0;
    bulletsFired = 0;
  }

  //getters

  public String getPlayerName()
  {
    return playerName;
  }

  public int[] getResult()
  {
    return results;
  }

  //setters

  public void setPlayerName(String playerName)
  {
    this.playerName = playerName;
  }

  public void setResult(int[] results)
  {
    this.results = results;
  }

  /*
public method with no return to add scores from each battle and store them in the results array - if score is greater than or equal to 0.
   also increasing variable numBattles by 1 .
   */
  public void addScore(int score)
  {
    if (score >= 0)
    {
      results[numBattles] = score;
      numBattles++;
    }
  }
  /*
public method returning a string used to display the results of each battle, including the player name
   battle number and score for each.
   */
  public String toString()
  {
    String display = "You have completed all of your battles!\n\n Scores for " + playerName + "\n";
    for ( int i = 0; i<numBattles; i++)
    {
      display = display + "     Battle " + (i+1) + ": " + results[i] + "\n";
    }
    return display;
  }
  /*
public method returning an integer calculating the highest score of all battles played. This sets the score of the first battle as the highest 
   and then checks each subsequent battle score to see if it is higher - if it is then it replaces the starting value as the highest. 
   */
  public int highestScore()
  {
    int highestScore = results[0];
    for (int i = 0; i<numBattles; i++)
    {
      if (results[i] > highestScore)
      {
        highestScore = results[i];
      }
    }
    return highestScore;
  }
  /*
public method returning an integer calculating the lowest score of all battles played. This sets the score of the first battle as the lowest 
   and then checks each subsequent battle score to see if it is lower - if it is then it replaces the starting value as the lowest. 
   */
  public int lowestScore()
  {
    int lowestScore = results[0];
    for (int i=0; i<numBattles; i++)
    {
      if (results[i] < lowestScore)
      {
        lowestScore = results[i];
      }
    }
    return lowestScore;
  }
  /*
public method returning an integer calculating the average score of all battles played. This adds the results of all 
   battles to the total variable and then divides this number by the number of battles that have taken place resulting in an average score.
   */
  public int averageScore()
  {
    int total = 0;
    for (int i=0; i<numBattles; i++)
    {
      total = total + results[i];
    }
    return total/numBattles;
  }
  /*
public method returning an integer calculating the total score of all battles played. This adds the results of all
   battles to the total variable and returns the value of the total variable.
   */
  public int totalScore()
  {
    int total = 0;
    for (int i=0; i<numBattles; i++)
    {
      total = total + results[i];
    }
    return total;
  }

  /* 
   public method returning an integer calculating the accuracy of player by dividing the total score by the total number of bulletsFired.
   */
  public int bulletAccuracy()
  {
    //turning result into a float to provide % accuracy - turning it back into an int so as to provide a result without decimal places.
    return (int)(((float)totalScore()/(float)bulletsFired) *100);
  }

  /*
public method with no return incrementing the bulletsFired variable - therefore counting the number of bullets fired. 
   This is used by the bulletAccuracy method above.
   */
  public void bulletFired()
  {
    bulletsFired++;
  }
}
