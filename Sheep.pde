public class Sheep
{
  private float sheepX;
  private float sheepY;
  private float sheepWidth;
  private float sheepHeight;
  private float sheepSpeedX;

  public Sheep() //default constructor method setting default values of fields
  {
    setSheepX(sheepX);
    setSheepY(sheepY);
    setSheepWidth(sheepWidth);
    setSheepHeight(sheepHeight);
    setSheepSpeedX(sheepSpeedX);
    resetSheep();
  }
  /*
  overloaded constructor method with no return taking in 1 parameter
   */
  public Sheep(float sheepSpeedX) 
  {
    this.sheepSpeedX = sheepSpeedX;
    setSheepX(sheepX);
    setSheepY(sheepY);
    setSheepWidth(sheepWidth);
    setSheepHeight(sheepHeight);
    resetSheep();
  }

  // getter methods
  public float getSheepX()
  {
    return sheepX;
  }

  public float getSheepY()
  {
    return sheepY;
  }

  public float getSheepWidth()
  {
    return sheepWidth;
  }

  public float getSheepHeight()
  {
    return sheepWidth;
  }

  public float getSheepSpeedX()
  {
    return sheepSpeedX;
  }

  //setter methods
  public void setSheepX(float sheepX)
  {
    this.sheepX = sheepX;
  }

  public void setSheepY(float sheepY) // validation to keep sheep clouds nearer to the top of the output window(sky)
  {
    if (sheepY >=360)
    {
      sheepY = 360;
    }
    if (sheepY <120)
    {
      sheepY = 120;
    } else
    {
      this.sheepY = sheepY;
    }
  }

  public void setSheepWidth(float sheepWidth)
  {
    if ((sheepWidth<120 || sheepWidth>120))
    {
      this.sheepWidth = 120;
    }
  }

  public void setSheepHeight(float sheepHeight)
  {
    if ((sheepHeight<75) || (sheepHeight>75))
    {
      this.sheepHeight = 75;
    }
  }

  public void setSheepSpeedX(float sheepSpeedX)
  {
    this.sheepSpeedX = sheepSpeedX;
  }

  /*
  public method with no return drawing the Sheep Cloud objects in the output window
   */
  public void drawSheepCloud()
  {
    fill(0);
    rect(sheepX-40, sheepY+35, 15, 35); //leg1
    rect(sheepX+20, sheepY+35, 15, 35); //leg2
    noStroke();
    fill(255);
    ellipse(sheepX, sheepY, sheepWidth, sheepHeight);//main body
    ellipse(sheepX, sheepY, sheepWidth-80, sheepHeight+25); //side body
    ellipse(sheepX-30, sheepY, sheepWidth-80, sheepHeight+25); //side body
    ellipse(sheepX+30, sheepY, sheepWidth-80, sheepHeight+25); //side body
    triangle(sheepX-45, sheepY-30, sheepX-55, sheepY-5, sheepX-85, sheepY+25); //tail
    fill(0);
    ellipse(sheepX+60, sheepY-25, sheepWidth-80, sheepHeight-15); //head
    ellipse(sheepX+45, sheepY-50, 15, 25); //ear1
    ellipse(sheepX+75, sheepY-50, 15, 25);//ear2
    fill(255);
    ellipse(sheepX+55, sheepY-30, 5, 10);//eye1
    ellipse(sheepX+65, sheepY-30, 5, 10);//eye2
    //displaying game info on sheep body
    fill(0);
    textSize(12);
    text("Battle: "+battle+"/3", sheepX-40, sheepY-10);
    text("Lives lost: "+livesLost+"/5", sheepX-40, sheepY+5);
    text("Score: "+score, sheepX-40, sheepY+20);
  }

  /*
public method with no return moving the sheep clouds across the screen by increasing the x coordinate, and 
   calling the resetSheep method once the sheep has reached the edge of the output window
   */
  public void move()
  {
    sheepX = sheepX + sheepSpeedX;
    if (sheepX >=width)
    {
      resetSheep();
    }
  }
  /*
  private helper method with no return setting starting values for the Sheep Clouds, and resetting them once the 
   sheep has crossed the width of the output window. 
   Called in contructor methods and move method.
   */
  private void resetSheep()
  {
    sheepX = 0;
    sheepY = random(40, height/2);
    sheepSpeedX = random(0.5, 2);
  }
}
