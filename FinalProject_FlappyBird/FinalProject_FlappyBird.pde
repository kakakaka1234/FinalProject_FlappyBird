//Global Variables
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer sound;
//test
AudioPlayer player;
AudioInput input;


Pipe p1 = new Pipe();
Pipe p2 = new Pipe();
Pipe p3 = new Pipe();
 
//bird height and width location
float birdy = 46;
float birdx = 56;
float gravity =4;
float jumpForce = 14;
 
//the speed of the pipes
int speed;
 
//score and game state
boolean gameOver = false;
int score = 0;
int highscore = 0;
 
int point = 1;
 
color birdColor =(#EDFF03);
 
 
void setup(){
  size(400,600);
  p1.x = width + 50;
  p2.x = width + 220;
  p3.x = width + 370;
  titleFont = createFont("BookmanOldStyle-Bold-48", 40);
  quitButtonSetup();
//test
  minim = new Minim(this);
  player = minim.loadFile("Typing On Keyboard-SoundBible.com-1459197142.mp3");
  input = minim.getLineIn();
  
  
  
  minim= new Minim(this);
  sound = minim.loadFile("Quiet.mp3");
  sound.loop();
}
 void draw(){
  background(#03FF76);
  p1.pipe();
  p2.pipe();
  p3.pipe();
 
  fill(birdColor);
  ellipse(birdx, birdy, 55,55);
  birdy += gravity;
  play();
  success(p1);
  success(p2);
  success(p3);
 
  if(mousePressed)
  {
    birdy -= jumpForce;
  }    
  quitButtonDraw();

}
 
 
void play(){
 
  if(gameOver == false)
  {
    speed = 2;
    p1.x -= speed;
    p2.x -= speed;
    p3.x -= speed;
   
    textSize(24);
    fill(255,255,255);
    text(score, width/2, 30);  
  }
 
  if(gameOver == true)
  {
    speed = 0;
    p1.x -= speed;
    p2.x -= speed;
    p3.x -= speed;
   
    if( highscore < score)
    {
       highscore = score;
    }
    rect(width*2/7,height/3,width*2/5,height/4);
    textSize(16);
    fill(0, 102, 153);
    textAlign(CENTER);
    text("Click : Play Again", width/2, height/2);
    text("Score: " + score, width/2, height/2 - 20);
    text("High-Score: " + highscore, width/2, height/2 - 40);
   
    if(mousePressed)
    {
       delay(900);
       score = 0;
       gameOver = false;
       birdy = 100;
       birdx = 56;
       p1.x = width + 50;
       p2.x = width + 220;
       p3.x = width + 370;
       p1.top = random(height/2);
       p1.bottom = random(height/2);
       p2.top = random(height/2);
       p2.bottom = random(height/2);
       p3.top = random(height/2);
       p3.bottom = random(height/2);
 
    }  
  }
 
}
 
void success(Pipe test){
 
  if(birdy < test.top || birdy > height - test.bottom)
  {
    if(birdx > test.x && birdx < test.x + test.w)
    {
      gameOver = true;
    }
  }
}
void mouseClicked(){
  quitButtonMouseClicked();}
  
void mousePressed()
{
  player.play();
}
void mouseReleased()
{
  player.close();
  player = minim.loadFile("Typing On Keyboard-SoundBible.com-1459197142.mp3");
}
