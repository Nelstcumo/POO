void poligonov2(float radio, float lados, float mousex, float mousey){
    float[][] coordenadas = new float[int(lados)][2];                //en este arregla se guardan las coordenadas 
    float theta = TWO_PI/lados;                                      
    float df_x = width/2;                                            // estas variables desplazan el pligono a un lugar más central en el canvas en función
    float df_y = height/2;                                            //de sus dimenciones
    for ( int i=0; i < lados; i++){                            
      coordenadas[i][0] = radio * cos(theta*(i+1));
      coordenadas[i][1] = radio * sin(theta*(i+1));
    }
    if (mousePressed == true){
      for ( int i = 0; i< lados; i++){
        if (i < lados-1){
        line(coordenadas[i][0]+mousex, coordenadas[i][1]+mousey, coordenadas[i+1][0]+mousex, coordenadas[i+1][1]+mousey);    
        }
        else{
        line(coordenadas[i][0]+mousex, coordenadas[i][1]+mousey, coordenadas[0][0]+mousex, coordenadas[0][1]+mousey);
        }
      }
    }

  }


void setup(){
  size(500,500);

}

void draw(){
  poligonov2(50,10, mouseX, mouseY);  
}
