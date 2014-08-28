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
  strokeWeight(1);
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
    rect(-10,-10,400,400,5);
  }

  lightningBolt();
  
  counter++;
}

void mousePressed()
{
  lightningBolt();
}

void keyPressed()
{
  //z wipes the board clean and "resets" it to plain black.
  if(key == 'z')
  {
    background(0);
  }
  if
}

void lightningFlash()
{
  noStroke();
  fill(255,255,255,50);
  rect(-10,-10,400,400,50);
  
  if(counter > counterTime + 10)
  {
    counter = 0;
    counterTime = int(random(60,240));
  }
}

void lightningBolt()
{
  while(endX < 300)
  {
    strokeWeight(int(random(3)));
    stroke(int(random(255)),int(random(255)),int(random(255)));
    
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