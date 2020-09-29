class Keys
{
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean upDown = false; // added boolean for player 2 (arrowkeys)
  private boolean leftDown = false;
  private boolean downDown = false;
  private boolean rightDown = false;
  
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
  
  public boolean UP()
  {
    return upDown;
  }
  
  public boolean LEFT()
  {
    return leftDown;
  }
  
  public boolean DOWN()
  {
    return downDown;
  }
  
  public boolean RIGHT()
  {
    return rightDown;
  }
  
  
  
  void onKeyPressed(char ch)
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
    else if(keyCode == UP) // added codes for player 2s' movement keys
    {
      upDown = true;
    }
    else if (keyCode == LEFT)
    {
      leftDown = true;
    }
    else if(keyCode == DOWN)
    {
      downDown = true;
    }
    else if(keyCode == RIGHT)
    {
      rightDown = true;
    }
  }
  
  void onKeyReleased(char ch/*, boolean code*/)
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
    else if(keyCode == UP) // added codes for player 2s' movement keys
    {
      upDown = false;
    }
    else if (keyCode == LEFT)
    {
      leftDown = false;
    }
    else if(keyCode == DOWN)
    {
      downDown = false;
    }
    else if(keyCode == RIGHT)
    {
      rightDown = false;
    }
  }
}
