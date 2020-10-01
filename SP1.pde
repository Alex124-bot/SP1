PImage startscreen, megaman, mario, sonic, zelda, gameover;
import processing.sound.*;
SoundFile file;

/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;

Game game = new Game(30, 20, 6, 2);
PFont font;
private boolean gameHasStarted = false;

public void settings() {
  size(1201, 801);
}

void setup()
{
  frameRate(10);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
  
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "Boss_1_-_Famitracker[Youtubemp3.download].mp3");
  file.play();
  file.amp(0.1);
  startscreen = loadImage("Press-any-key-to-continue.png");
  megaman = loadImage("megaman.png");
  mario = loadImage("mario.jpg");
  sonic = loadImage("sonic.jpg");
  zelda = loadImage("zelda.jpg");
  gameover = loadImage("gameover.jpg");
}

void keyReleased()
{
  game.onKeyReleased(key);
}

void keyPressed()
{
  fill(255);
  textFont(font,10);
  gameHasStarted = true;
  game.onKeyPressed(key);
}

void draw()
{
   if (!gameHasStarted)
  {
    image(startscreen, 0, height/2-170);
    startscreen.resize(width,0);
    /*textAlign(CENTER);
    fill(255,0,0);
    text("SP1: Gridbased game\nPress any key to start game", width / 2, height / 2-178);
    */
  } else
  {
     background(0); //Black
    if (!game.getGameIsOver())
    {
    game.update();
    }
  background(0); //Black
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  int[][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++)
  {
    for (int x = 0; x < game.getWidth(); x++)
    {
      if(board[x][y] == 0)
      {
        fill(0,0,0);
        stroke(100,100,100);
        rect(x*40, y*40, 40, 40);        
      }
      else if(board[x][y] == 1)
      {
        image(megaman,x*40,y*40); 
      }
      else if(board[x][y] == 2)
      {
        image(mario,x*40,y*40); 
      }
      else if(board[x][y] == 3)
      {
        image(zelda,x*40,y*40); 
      }
      else if(board[x][y] == 4)
      {
        image(sonic,x*40,y*40);
      }
      //stroke(100,100,100);
      //rect(x*40, y*40, 40, 40);
    }
  }
  fill(255);
  text("Lifes: "+game.getPlayerLife(), 25,25); // playerlife for player
  fill(255);
  text("Points: "+game.getPlayerPoints(), 100,25); // playerpoints for player
  fill(255);
  text("Lifes: "+game.getPlayer2Life(), width-100,25);// playerlife for player 2
  fill(255);
  text("Points: "+game.getPlayer2Points(), width-200,25); // playerpoints for player 2
  fill(255);
    }
  if (game.getGameIsOver())
  {
    image(gameover, 0, 0,width,height);
    textMode(CENTER);
    textSize(50);
    text(game.getWinnerName() + "wins!", width / 2-145, height / 2-200);
  }
}
