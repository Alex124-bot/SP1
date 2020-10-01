import java.util.Random;

class Game
{
  private Random rnd;
  private final int width;
  private final int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player2Life;
  private int playerPoints;
  private int player2Points;
  private int winScore = 10;
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot[] food;
  private boolean gameIsOver = false;
  private String winnerName;
  
   
  Game(int width, int height, int numberOfEnemies, int numberOfFood)
  {
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of enemies must be positive"); 
    }
    if(numberOfFood < 0)
    {
      throw new IllegalArgumentException("Number of food must be positive"); // muligvis throw an exception for to litle food
    }
    
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0,0,width-1, height-1);
    player2 = new Dot(width-1,0,width-1, height-1);//player 2
    enemies = new Dot[numberOfEnemies];
    food = new Dot[numberOfFood];
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width/2, height-1, width-1, height-1);
    }
    for(int i = 0; i < numberOfFood; ++i)
    {
      //random int and random food spawn
      int startX = int(random(width-1));
      int startY = int(random(height-1));
      food[i] = new Dot(startX, startY, width-1, height-1);
    }
    
    this.playerLife = 10;
    this.player2Life = 10;
    this.playerPoints = 0;
    this.player2Points = 0;
    
  }
  
  public int getWidth()
  {
    return width;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getPlayerLife()
  {
    return playerLife;
  }
  
  public int getPlayer2Life()
  {
    return player2Life;
  }
  
  public int getPlayerPoints()
  {
    return playerPoints;
  }
  
  public int getPlayer2Points()
  {
    return player2Points;
  }
  
  public String getWinnerName()
  {
     return winnerName; 
  }
  
  public boolean getGameIsOver()
  {
   return gameIsOver; 
  }
  
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }
  
  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }
  
  public void update()
  {
    if (!gameIsOver) 
    {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateFood();
    checkForCollisions();
    clearBoard();
    populateBoard();
    } else { // Game is over
      clearBoard();
    }
  }
  
  
  
  public int[][] getBoard()
  {
    //ToDo: Defensive copy?
    return board;
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  
  private void updatePlayer()//s()   
  /* here i'll make so that there is a player 2 that moves
  with the arrowkeys. note that the enemies will have to be linked in some way or ways 
  to player 2 as weel as they are linked to player on movement*/
  
  {
    //Update player
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }  
  }
    
  private void updatePlayer2()
  {
    //Update player2 
    if(keys.UP() && !keys.DOWN())
    {
      player2.moveUp();
    }
    if(keys.LEFT() && !keys.RIGHT())
    {
      player2.moveLeft();
    }
    if(keys.DOWN() && !keys.UP())
    {
      player2.moveDown();
    }
    if(keys.RIGHT() && !keys.LEFT())
    {
      player2.moveRight();
    }
  }
  
  private void updateEnemies()
  {
    for(int i = 0; i < enemies.length;++i)
    {
      //Should we follow or move randomly?
      //2 out of 3 we will follow..
      if(rnd.nextInt(3) < 2)
      {
        if (i % 2 != 0) // of enemie is at an odd index number we follow player 1
        {
          //We follow
          int dx = player.getX() - enemies[i].getX();
          int dy = player.getY() - enemies[i].getY();
          if(abs(dx) > abs(dy))
          {
            if(dx > 0)
            {
              //Player is to the right
              enemies[i].moveRight();
            }
            else
            {
              //Player is to the left
              enemies[i].moveLeft();
            }
          }
          else if(dy > 0)
          {
            //Player is down;
            enemies[i].moveDown();
          }
          else
          {//Player is up;
            enemies[i].moveUp();
          }
        }
        if (i % 2 == 0) // if enemies are at an even number we follow player 2
        {
          //We follow
          int dx = player2.getX() - enemies[i].getX();
          int dy = player2.getY() - enemies[i].getY();
          if(abs(dx) > abs(dy))
          {
            if(dx > 0)
            {
              //Player2 is to the right
              enemies[i].moveRight();
            }
            else
            {
              //Player2 is to the left
              enemies[i].moveLeft();
            }
          }
          else if(dy > 0)
          {
            //Player2 is down;
            enemies[i].moveDown();
          }
          else
          {//Player2 is up;
            enemies[i].moveUp();
          }
        }
        else
        {
          //We move randomly
          int move = rnd.nextInt(4);
          if(move == 0)
          {
            //Move right
            enemies[i].moveRight();
          }
          else if(move == 1)
          {
            //Move left
            enemies[i].moveLeft();
          }
          else if(move == 2)
          {
            //Move up
            enemies[i].moveUp();
          }
          else if(move == 3)
          {
            //Move down
            enemies[i].moveDown();
          }
        }
      }
    }
  }
  
  private void updateFood()
  {                                                       /*copy of updateEnemies, here i'll try and make food
                                                          act as the opposite, or something like that, of enemies. moving away if 1 or 2 or
                                                          random if 3. if thats how enemies move*/
    for(int i = 0; i < food.length; ++i)
    {
      //Should we escape or move randomly?
      //2 out of 3 we will escape..
      if(rnd.nextInt(3) < 2)
      {
        if (i % 2 != 0)
        {
          //We escape player 1
          int dx = player.getX() - food[i].getX();
          int dy = player.getY() - food[i].getY();
          if(abs(dx) > abs(dy))
          {
            if(dx > 0)
            {
              //Player is to the right
              food[i].moveLeft();
            }
            else
            {
              //Player is to the left
              food[i].moveRight();
            }
          }
          else if(dy > 0)
          {
            //Player is down;
            food[i].moveUp();
          }
          else
          {//Player is up;
            food[i].moveDown();
          }
        }
        if (i % 2 == 0)
        {
          //We escape player 2
          int dx = player2.getX() - food[i].getX();
          int dy = player2.getY() - food[i].getY();
          if(abs(dx) > abs(dy))
          {
            if(dx > 0)
            {
              //Player 2 is to the right
              food[i].moveLeft();
            }
            else
            {
              //Player 2 is to the left
              food[i].moveRight();
            }
          }
          else if(dy > 0)
          {
            //Player2 is down;
            food[i].moveUp();
          }
          else
          {//Player2 is up;
            food[i].moveDown();
          }
        }
        else
        {
          //We move randomly
          int move = rnd.nextInt(4);
          if(move == 0)
          {
            //Move right
            food[i].moveRight();
          }
          else if(move == 1)
          {
            //Move left
            food[i].moveLeft();
          }
          else if(move == 2)
          {
            //Move up
            food[i].moveUp();
          }
          else if(move == 3)
          {
            //Move down
            food[i].moveDown();
          }
        }
      }
    }
  }
  
  private void populateBoard() // 1 = player 2 = enemies 3 = food 4 = player 2
  {
    //Insert player
    board[player.getX()][player.getY()] = 1;
    //Insert player 2
    board[player2.getX()][player2.getY()] = 4;
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2;
    }
    // Insert food
    for(int i = 0; i < food.length; ++i)
    {
    board[food[i].getX()][food[i].getY()] = 3;
    }
  }
   
  private void checkForCollisions() 
  {
    //Check enemy collisions
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
         // Reduce playerLife by 1, and check if it is equals to 0
        if (--playerLife == 0) 
        {
          gameIsOver = true;
          winnerName = "Player 2";
        }
      }
    }
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY())
      {
        //We have a collision
        // Reduce playerLife by 1, and check if it is equals to 0
        if (--player2Life == 0) 
        {
          gameIsOver = true;
          winnerName = "Player 1";
        }
      }
    }
   //Check food collisions for player
    for(int i = 0; i < food.length; ++i)
    {
      if(food[i].getX() == player.getX() && food[i].getY() == player.getY())
      {
        //We have a collision
        //Increase playerFood by 1 and see if we hit the score limit
        if (++playerPoints == winScore) 
        {
          gameIsOver = true;
          winnerName = "Player 1";
        }
        
        food[i].setRandomPosition();
      }
    } 
    //Check food collisions for player2 
    for(int i = 0; i < food.length; ++i)
    {
      if(food[i].getX() == player2.getX() && food[i].getY() == player2.getY())
      {
        //We have a collision
         if (++player2Points == winScore)
         {
          gameIsOver = true;
          winnerName = "Player 2";
         }
        food[i].setRandomPosition();
      }
    } 
  }
}
