/*

ClIFFORD ATTRACTOR [also known as PICKOVER ATTRACTOR]
by Clifford A. Pickover

a chaotic two-dimensional piecewise linear map defined by

  xn+1 = sin(a * yn) + c * cos(a * xn)
  yn+1 = sin(b * xn) + d * cos(b * yn)

  a = 1.7, b = 1.7, c = 0.6, d = 1.2  //test values
  
PROBLEMS TO SOLVE:
[-] There are some parazite points in the bottom-left.
[-] Have to sort all point to make aesthetically good-looking
    vector visual.

REFERENCES:
https://en.wikipedia.org/wiki/Clifford_A._Pickover
http://rosettacode.org/wiki/Map_range

@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk

*/
import processing.pdf.*;

float a, b, c, d;
float scale = 150.0;
float xn, yn;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup(){
  
 size(800, 800);
 
   a = 1.7; b = 1.7; c = 0.6; d = 1.2;
   
   for(int j = 0; j < 64; j++){
     
   float x = random(-3, 3);
   float y = random(-3, 3);
   
       for(int i = 0; i < 1024; i++ ){
        
           xn = x;
           yn = y;
           
           x = sin(a * yn) + c * cos(a * xn);
           y = sin(b * xn) + d * cos(b * yn);
           
           //stroke(0);
           //strokeWeight(0.75);
           points.add(new PVector(1.25 * x * scale, -y * scale));     
           
       }
   }
  
  //filter(BLUR, 4);
  //filter(POSTERIZE, 4);

  beginRecord(PDF, "output.pdf");
  translate(width * 0.5, height * 0.5);
  
  noFill();
  stroke(0);
  strokeWeight(0.1);
  
  beginShape();
  for(int p = 0; p < points.size(); p++){
      vertex(points.get(p).x, points.get(p).y); 
  }
  endShape();
  endRecord();
    
}
