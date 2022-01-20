public class Bullet 
{
  private float x; 
  private float y; 
  private float diameter; 
  private boolean active;

  public Bullet() //default constructor
  {
    this.active = false; //setting active variable default value to false
  }
  /*
overloaded constructor - public method with no return value taking in 3 parameters
   */
  public Bullet(float x, float y, float diameter)
  {
    this.active = false;
    this.x = x; 
    this.y = y;

    if ((diameter >=15 ) && (diameter <=25)) //validation so that diameter does not go outside certain dimensions
    {
      this.diameter = diameter;
    } else
    {
      this.diameter = 20;
    }
  }
  /*
public method with no return displaying the Bullet
   */
  public void display()
  {
    fill(0); 
    circle(x, y, diameter);
  }
  /*
public method with no return moving the bullet up the screen by decreasing the y-axis coordinate. 
   If the y coordinate reaches the top of the screen (y<=0) the resetBullet method is called.
   */
  public void move()
  {
    this.y = y-3;  
    if (y <= 0) 
    {
      resetBullet();
    }
  }

  //getter methods  
  public float getX() 
  {
    return x;
  }

  public float getY()
  {
    return y;
  }

  public float getDiameter()
  {
    return diameter;
  }

  public boolean getActive()
  {
    return active;
  }

  //setter methods 
  public void setX(float x)
  {
    this.x = x;
  }

  public void setY(float y)
  {
    this.y = y;
  }

  public void setDiameter(float diameter)
  {
    if ((diameter >=15 ) && (diameter <=25)) //validation so that diameter does not go outside certain dimensions
    {
      this.diameter = diameter;
    }
  }

  public void setActive(boolean active)
  {
    this.active = active;
  }
  /*
private helper method with no return resetting boolean variable to false.
   */
  private void resetBullet()
  {
    this.active = false;
  }
}
