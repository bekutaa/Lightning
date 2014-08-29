int startX = 0;
int startY = int(random(100,200));
int endX = 0;
int endY = 150;

//The counter is used as a timer for determining when to make lightning flash.
int counter = 0;
int counterTime = int(random(60,240));

void setup()
{
  size(300,300);
  background(0);
}

void draw()
{
  //Lightning flashes every one to four seconds if the framerate is defaulted to 60.
  if(counter > counterTime)
  {
    lightningFlash();
  }
  
  //when lightning is not flashing, "fade" away the previous lightning bolts.
  else
  {
    noStroke();
    fill(0,0,0,5);
    rect(-50,-50,400,400);
  }

  //Lightning bolts come in only one color and one thickness per bolt.
  lightningBolt();
  
  counter++;
}

void mousePressed()
{
  //Clicking makes a lightning bolt strike the position of the mouse from the left side of the screen.
  startX = mouseX;
  startY = mouseY;
  
  endX = startX;
  
  stroke(int(random(255)),int(random(255)),int(random(255)));
  strokeWeight(int(random(3)));  
  
  while(endX > 0)
  {    
    endX = startX - int(random(15));
    endY = startY - int(random(-12,12));
    
    line(startX,startY,endX,endY);
    
    startX = endX;
    startY = endY;
  }
}

void keyPressed()
{
  //z wipes the board clean and "resets" it to plain black.
  if(key == 'z')
  {
    background(0);
  }
}

void lightningFlash()
{
  //Lightning flashes and fades for ten frames before the counter is reset to a new number.
  noStroke();
  fill(255,255,255,50);
  rect(-50,-50,400,400,50);
  
  if(counter > counterTime + 10)
  {
    counter = 0;
    counterTime = int(random(60,240));
  }
}

void lightningBolt()
{
  //Lightning bolt begins from the left edge of the screen and draws lines to form a bolt of"lightning" until it reaches the right edge.  
  stroke(int(random(255)),int(random(255)),int(random(255)));
  strokeWeight(int(random(3)));
  
  while(endX < 300)
  {        
    endX = startX + int(random(15));
    endY = startY + int(random(-12,12));
    
    line(startX,startY,endX,endY);
    
    startX = endX;
    startY = endY;
  } 
   
  startX = 0;
  startY = int(random(100,200));
  endX = 0;
  endY = int(random(100,200));
}
