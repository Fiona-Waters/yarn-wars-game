public class YarnBall
{
  private float yarnX;
  private float yarnY;
  private float yarnWidth;
  private float dropSpeedY;

  //default constructor method setting default values of fields using validation in setter methods
  public YarnBall()  
  {
    setYarnX(yarnX);
    setYarnY(yarnY);
    setYarnWidth(yarnWidth);
    resetYarnBall();
    dropSpeedY = random(0.5, 1.5);
  }
  /*
  overloaded constructor method taking in 3 parameters, not called in main program
   */
  public YarnBall(float yarnX, float yarnY, float yarnWidth) 
  {
    this.yarnX = yarnX;
    this.yarnY = yarnY;
    this.yarnWidth = yarnWidth;
    dropSpeedY = random(0.5, 1.5);
  }

  //getter methods
  public float getYarnX()
  {
    return yarnX;
  }

  public float getYarnY()
  {
    return yarnY;
  }

  public float getYarnWidth()
  {
    return yarnWidth;
  }


  public float getDropSpeedY()
  {
    return dropSpeedY;
  }

  //setter methods
  //method with validation so that yarn ball does not move outside the x-axis/width of output window
  public void setYarnX(float yarnX)
  { 
    if (yarnX <50)
    {
      yarnX = 50;
    }
    if (yarnX >width-50)
    {
      yarnX = width-50;
    }
  }

  public void setYarnY(float yarnY)
  {
    this.yarnY = yarnY;
  }
  //validation used to set diameter reasonably
  public void setYarnWidth(float yarnWidth)
  {     
    if ((yarnWidth >=40) && (yarnWidth <=80))
    {
      this.yarnWidth = yarnWidth;
    } else 
    {
      this.yarnWidth = 60;
    }
  }

  public void setDropSpeedY(float dropSpeedY)
  {
    this.dropSpeedY = dropSpeedY;
  }
  /*
  public method with no return drawing the Yarn Balls with angry faces
   */
  public void drawAngryYarn()
  {
    stroke(0);
    strokeWeight(1);
    fill(181, 92, 180);
    circle(yarnX, yarnY, yarnWidth);
    line(yarnX-30, yarnY+5, yarnX+21, yarnY+21);
    line(yarnX-28, yarnY-5, yarnX +26, yarnY +11);
    line(yarnX-26, yarnY-15, yarnX+30, yarnY+1);
    line(yarnX, yarnY-30, yarnX-5, yarnY-14);
    line(yarnX+10, yarnY-28, yarnX+4, yarnY-8);
    line(yarnX+20, yarnY-23, yarnX+13, yarnY-2);
    line(yarnX-17, yarnY+24, yarnX-12, yarnY+10);
    line(yarnX-7, yarnY+29, yarnX-2, yarnY+14);
    line(yarnX+3, yarnY+30, yarnX+8, yarnY+18);
    fill(255, 0, 0);
    circle(yarnX - 12, yarnY - 5, 10);
    circle(yarnX + 12, yarnY - 5, 10);
    strokeWeight(4);
    line(yarnX -18, yarnY -18, yarnX -7, yarnY -12);
    line(yarnX +18, yarnY -18, yarnX +7, yarnY -12);
    line(yarnX -10, yarnY +12, yarnX +10, yarnY +12);
  }

  /*
  public method with no return moving the 
   yarn balls down the screen by increasing the y coordinate
   */
  public void update()
  {
    yarnY = yarnY + dropSpeedY;
  }

  /*
public method with boolean return used to show when a life is lost in the game - i.e. when a Yarn Ball reaches the 
   end of the screen a life is lost.
   */
  public boolean reachedBottom()
  {
    boolean lifeLost = false;

    if (yarnY >= height) 
    {
      lifeLost = true;
    }
    return lifeLost;
  }
  /*
  public method with no return resetting yarn ball to certain values. Used in main program.
   Also called in default constructor to set starting values of yarn ball.
   */
  public void resetYarnBall()
  {
    yarnX = random(30, width-30);
    yarnY = 0;
  }
}
