class Pipe
{
  float top = random(height/2 + 250);
  float bottom = random(height/2 +250);
 
 
  float x = width + 150;
  float w = 70;
  color pipeColor = color(0, 255, 0);
 
  void pipe()
  {
    fill(pipeColor);
    rect(x, 0, w, top);
    rect(x, height-bottom, w, bottom);
   
    if(x < -100)
    {
     score += point;
     x = width;
     top = random(height/2);
     bottom = random(height/2);
    }
 
   
  }
 
 
}
