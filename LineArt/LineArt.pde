/*

 Vectorized LineArt 
 
 0 1 2 3 4 5 6 7 8 ...
 1 a b c d e f g h       
 2 b c d e f g h x  
 3 c d e f g h x y 
 4 d e f g h x y z
 5 e f g h x y z 
 6 f g h x y z  
 7 g h x y z
 8 h x y z
 
 HPGL Reference:
 http://paulbourke.net/dataformats/hpgl/
 http://paulbourke.net/dataformats/hpgl/hpgl_rus.html (RUS)
 https://pypi.python.org/pypi/Chiplotle/0.4
 
 */

import processing.pdf.*;

float gap = 2.5;

PImage source;
PVector line[] = {new PVector(0.0, 0.0), new PVector(0.0, 0.0)};

void setup() {
  size(750, 750, "processing.core.PGraphicsRetina2D");  

  source = loadImage("sample2.png");

  beginRecord(PDF, "output.pdf"); 
  
  background(255);
  stroke(0);
  strokeWeight(0.75);

  PVector startPoint = new PVector(0, 0);

  while (startPoint.x < width && startPoint.y < height) {
    if (startPoint.y < height - 1 - gap ) { 
      startPoint.y += gap; 
      crossLine(new PVector(0, startPoint.y));
    } else { 
      startPoint.x += gap; 
      crossLine(new PVector(startPoint.x, startPoint.y));
    }
  }
  
  endRecord();
  
}

void crossLine(PVector point) {
  while (point.x < width || point.y > 0 ) {
    //point(point.x, point.y); 
    //if(source.get(point.x, point.y) == -16777216) setLine(point.x, point.y);
    setLine(source.get((int)point.x, (int)point.y), point);
    point.x++; 
    point.y--;
  }
}

void setLine(color c, PVector point){
 
//        -1 : white
// -16777216 : black
  
if(c == -16777216) { 
if( line[0].x == 0 && line[0].y == 0) { line[0].x = point.x; line[0].y = point.y; line[1].x = point.x; line[1].y = point.y; } else
line[1].x = point.x; line[1].y = point.y;
}
else
{
line(line[0].x, line[0].y, line[1].x, line[1].y);
line[0].x = 0.0; line[0].y = 0.0; line[1].x = 0.0; line[1].y = 0.0;
}
}
