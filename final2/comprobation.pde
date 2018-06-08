int comprobation(int x,int y){
  // a esto se le llama castear, es hacer que un numero flotante vuelva redondeado.
  for (int i = 0; i<50;i++){
    if (x <= (int(drops[i].getX())+20) && x >= (int(drops[i].getX())-20)
      && y <= (int(drops[i].getY())+20) && y >= (int(drops[i].getY())-20)){
      return  1;   
    }
    println(int(drops[i].getX()), " , ", int(drops[i].getY()));
    println(x,", ",y);
  }
  return 0;
}