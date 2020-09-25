class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean UP = false; // added boolean for player 2 (arrowkeys)
  private boolean LEFT = false;
  private boolean DOWN = false;
  private boolean RIGHT = false;
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
  
  /*public boolean UP()
  {
    return UP;
  }
  
  public boolean LEFT()
  {
    return LEFT;
  }
  
  public boolean DOWN()
  {
    return DOWN;
  }
  
  public boolean RIGHT()
  {
    return RIGHT;
  }
  */
  
  
  void onKeyPressed(char ch/*, int code*/)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
  /*else if(code == UP) // added codes for player 2s' movement keys
    {
      UP = true;
    }
    else if (code == LEFT)
    {
      LEFT = true;
    }
    else if(code == DOWN)
    {
      DOWN = true;
    }
    else if(code == RIGHT)
    {
      RIGHT = true;
    }*/
  }
  
  void onKeyReleased(char ch, boolean code)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = false;
    }
    else if(code == UP) // added codes for player 2s' movement keys
    {
      UP = false;
    }
    else if (code == LEFT)
    {
      LEFT = false;
    }
    else if(code == DOWN)
    {
      DOWN = false;
    }
    else if(code == RIGHT)
    {
      RIGHT = false;
    }
  }
}
