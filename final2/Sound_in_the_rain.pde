
int zona(int x, int y) {
  int zona = -1;
  
  if(x>= 0 && x < 266 && y >=0 && y <=300){
     zona = 1;
  }
  if(x>= 266 && x < 533 && y >= 0 && y <=300){
     zona = 2;
  }
  if (x >= 533 && x <800 && y >= 0 && y <=300){
      zona = 3;
  }
  if (x >= 0 && x <266 && y >= 300 && y <=600){
      zona = 4;
  }
  if (x >= 266 && x <533 && y >= 300 && y <=600){
      zona = 5;
  }
    if (x >= 480 && x <720 && y >= 240 && y <=480){
      zona = 6;
  }
  
    return zona;
}