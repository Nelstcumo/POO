int[][] malla_actual;
int[][] malla_next;
int tamano_celda = 20;
boolean pause = true;
int vecinos;

void setup(){
  size(700,700);
  frameRate(10);
  malla_actual = new int[width/tamano_celda][height/tamano_celda];
  malla_next = new int[width/tamano_celda][height/tamano_celda];
  crear_malla();
  //print(malla_actual.length);
}

void draw(){  
  init_malla();
  if (pause == false){
    next_gen();
    actualizar();
  }  
}


void crear_malla(){        
  for (int i = 0; i < malla_actual.length; i++){
    for (int j = 0; j < malla_actual[0].length; j++){   
      malla_actual[i][j] = 0;
      malla_next[i][j] = 0;
      rect(i*tamano_celda,j*tamano_celda,tamano_celda,tamano_celda);                                                    
    }
  }
}

void init_malla(){
  for (int i = 0; i < malla_actual.length; i++){
    for (int j = 0; j < malla_actual[0].length; j++){ 
      if (malla_actual[i][j]== 1){
        fill(0);
        rect(i*tamano_celda,j*tamano_celda,tamano_celda,tamano_celda);
      }else {
        fill(255);
        rect(i*tamano_celda,j*tamano_celda,tamano_celda,tamano_celda);
      }    
    }
  }
}

void next_gen(){
  for (int i = 1; i < malla_actual.length-1; i++){
    for (int j = 1; j < malla_actual[0].length-1; j++){
      vecinos = 0;
      if (malla_actual[i][j-1]==1){
        vecinos += 1;
      } 
      if (malla_actual[i+1][j-1]==1){
        vecinos += 1;
      }
      if (malla_actual[i+1][j]==1){
        vecinos += 1;
      }
      if (malla_actual[i+1][j+1]==1){
        vecinos += 1;
      }
      if (malla_actual[i][j+1]==1){
        vecinos += 1;
      }
      if (malla_actual[i-1][j+1]==1){
        vecinos += 1;
      }
      if (malla_actual[i-1][j]==1){
        vecinos += 1;
      }
      if (malla_actual[i-1][j-1]==1){
        vecinos += 1;
      }
      if (malla_actual[i][j] == 0 && vecinos == 3){
        malla_next[i][j] = 1;
      } else if(malla_actual[i][j] == 1 && (vecinos == 3 || vecinos == 2)){
        malla_next[i][j] = 1;
      } else {
        malla_next[i][j] = 0;
      }
    }
  }
}

void actualizar(){
  for (int i = 1; i < malla_actual.length-1; i++){
    for (int j = 1; j < malla_actual[0].length-1; j++){
      malla_actual[i][j] = malla_next[i][j];
    }
  }
}

void mouseClicked(){
  malla_actual[mouseX/tamano_celda][mouseY/tamano_celda] = 1;
}

void keyPressed(){
  if (pause == true){
    pause = false;
  } else{
    pause = true;
  }
}
