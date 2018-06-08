class Drops {

  float x,y;
  PImage imagen;
  
  Drops(){
    x= random(10,790);
    y = random(-720,0);
   
    //Image = loadimage();
  
  }
  void Movement(){
    y = y +10;
    if(y>=600){
       y = random(-720,0);
       x= random(10,790);
    }
  
  }
  float getX(){
  return x;
  }
  
  float getY(){
  return y;
  }
  
  void DrawDrop(){
    Movement();
    ellipse(x,y,1,10);
    fill(255);
    stroke(255);
  
  }
}