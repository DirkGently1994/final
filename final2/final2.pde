import processing.sound.*;
SoundFile file;
PImage drops1,background1,tree;
PGraphics tree2;
int x,y;
int Sector;
int soundflag = 0;

Drops[] drops;


void setup(){
  size (800,600);
    init();
  
  drops1 = loadImage("drop.png");
 tree = loadImage("tree15.png");
  background1 = loadImage("final1.jpg");
  
  tree2 = createGraphics(233,300);
  
  drops = new Drops[50];
  for (int i = 0; i < 50; i ++){
    drops[i] = new Drops();
    
    
  }

  
  
}


void draw (){
  background(background1);
  for (int i = 0; i < 50; i ++){
    drops[i].DrawDrop();
  }
    
     if (perticles.size() == 0) {
    waiting();
  } else {
    drawing();
  }

    
  tree2.beginDraw();
  tree2.background(100);
  tree2.stroke(255);
  tree2.line(20, 20, mouseX, mouseY);
  tree2.endDraw();
  image(tree, 9, 30); 
  }



void mousePressed(){
  x = mouseX;
  y = mouseY;
  Sector = zona(x,y);
  
  if( comprobation(x,y)==1 ){
    switch(Sector){
      case 1:
       
      file = new SoundFile(this,"Vol1 02 [PROPHECY] Hymn of the Fayth.mp3");
      file.play();
        
      break;
      
      case 2:
      file = new SoundFile(this, "To Build a Home - The Cinematic Orchestra (Lyrics).mp3");
      file.play();
      break;
      
      case 3:
      file = new SoundFile (this, "Agnes Obel - Familiar  DARK  Lyrics  Sub. Español.mp3");
      file.play();
      break;
      
      case 4:
      file = new SoundFile(this, "Detektivbyrån - E 18.mp3");
      file.play();
      
      break;
      
      case 5:
      file = new SoundFile (this, "Detektivbyrån - Om Du Möter Varg.mp3");
      file.play();
      break;
      
      case 6:
      file = new SoundFile (this,"Detektivbyrån - Sista Tryckaren.mp3");
      break;
      
      default:
      break;
    
      }
      soundflag = 1;
  }
  else{
    soundflag = 0;
    
  }
  println(soundflag);
}

void mouseReleased(){
  if(soundflag == 1){
 Sector = -1;
 file.stop();
}
}