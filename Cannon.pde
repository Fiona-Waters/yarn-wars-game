public class Cannon 
{
  private int xCoord1; 
  private int yCoord1; 
  private int xCoord2;
  private int yCoord2;
  private int xCoord3;
  private int yCoord3;
  private int cannonBottomWidth; //variable setting the bottom width of the triangle, i.e. the distance between the x coordinates

  public Cannon() //default constructor method setting default values of fields
  {
    cannonBottomWidth = 100;
    xCoord1 = 0;
    xCoord2 = cannonBottomWidth;
    xCoord3 = cannonBottomWidth/2;
    yCoord1 = height;
    yCoord2 = height;
    yCoord3 = height-50;
  }

  //getter methods
  public int getXCoord1()
  {
    return xCoord1;
  }

  public int getYCoord1()

  {
    return yCoord1;
  }

  public int getXCoord2()
  {
    return xCoord2;
  }

  public int getYCoord2()
  {
    return yCoord2;
  }

  public int getXCoord3()
  {
    return xCoord3;
  }

  public int getYCoord3()
  {
    return yCoord3;
  }

  public int getCannonBottomWidth()
  {
    return cannonBottomWidth;
  }
  //setter methods
  //method with validation so that cannon does not move outside the output window
  public void setXCoord1(int xCoord1) 
  {
    if (xCoord1<0)
    {
      xCoord1 = 0;
    } else if (xCoord1 >width-100)
    {
      xCoord1 = width-100;
    } else
    {
      this.xCoord1 = xCoord1;
    }
  }
  //method with validation so that cannon does not move outside the output window 
  public void setXCoord2(int xCoord2)
  {
    if (xCoord2 <100)
    {
      xCoord2 = 100;
    } else if (xCoord2 >=width)
    {
      xCoord2 = width;
    } else
    {
      this.xCoord2 = xCoord2;
    }
  }
  //method with validation so that width of cannon is constant
  public void setXCoord3(int xCoord3)
  {
    if (xCoord3 != xCoord1 + cannonBottomWidth/2)
      xCoord3 = xCoord1 + cannonBottomWidth/2;
    else
    {
      this.xCoord3 = xCoord3;
    }
  }

  public void setYCoord1(int yCoord1)
  {
    if (yCoord1 != height)
    {
      yCoord1 = height;
    }
  }

  public void setYCoord2(int yCoord2)
  {
    if (yCoord2 != height)
    {
      yCoord2 = height;
    }
  }

  public void setYCoord3(int yCoord3)
  {
    if (yCoord3 != height-50)
    {
      yCoord3 = height-50;
    }
  }

  public void setCannonBottomWidth(int cannonBottomWidth)
  {
    if (cannonBottomWidth != 100)
    {
      cannonBottomWidth = 100;
    }
  }

  /*
public method with no return which displays the cannon - initially a triangle shape with circle and rectangles attached to the same coordinates.
   */
  public void display()
  {
    fill(0); 
    noStroke(); 
    triangle(xCoord1, yCoord1, xCoord2, yCoord2, xCoord3, yCoord3); 
    circle(xCoord3, yCoord3, 50);
    rect(xCoord3-25, yCoord3, 50, 50); 
    rect(xCoord3-45, yCoord3+20, 20, 30);
    rect(xCoord3+25, yCoord3+20, 20, 30);
  } 

  /* 
   public method with no return that takes in 1 parameter allowing for movement of the cannon object when called in the keyPressed method 
   in main program
   calling setter methods to envoke validation
   */
  public void moveCannon(int amount)
  {
    this.setXCoord1(xCoord1 +amount);
    this.setXCoord2(xCoord2 +amount);
    this.setXCoord3(xCoord3 +amount);
  }
}
