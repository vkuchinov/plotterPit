/*

PSEUDO 3D SPHERE 

There are M lines of latitude (horizontal) and N lines of longitude (vertical), then put dots at
(x, y, z) = (sin(Pi * m/M) cos(2Pi * n/N), sin(Pi * m/M) sin(2Pi * n/N), cos(Pi * m/M))
for each m in { 0, ..., M } and n in { 0, ..., N-1 } and draw the line segments between the dots, accordingly.
edit: maybe adjust M by 1 or 2 as required, because you should decide whether or not to count "latitude lines" at the poles

[x] angle range of m/n

FURTHER READING:
https://processing.org/discourse/beta/num_1228387702.html
http://shiffman.net/2011/02/03/rotate-a-vector-processing-js/

*/

import processing.pdf.*;

int M = 256;               //latitude # of segments
int N = 256;               //longtitude # of segments
float scale = 250.0;       //scale factor

//arbitary axis
PVector axis = new PVector(0.75, 0.4, -1.8);

float rotateAngle = 155.5; //rotate angle

void setup(){

//processing.core.PGraphicsRetina2D works only in 2.x, not 3.x 
size(750, 750, "processing.core.PGraphicsRetina2D");

beginRecord(PDF, "output.pdf"); 
 
translate(width/2, height/2);
noFill();
println(axis);

//arbitary axis
axis.normalize();
println(axis);
  
  for(int n = 0; n < N; n++){
    
    //128: 0 - 32, 64 - 96
    //visible segments
    if(n < 0.25*N  || ( n > 0.5*N && n < 0.75*N) ) { 
    
    beginShape();
    
    for(int m = 0; m < M + 1; m++){
    
    stroke(0);
    strokeWeight(0.5);
    
    PVector dot = new PVector(0.0, 0.0, 0.0); 
    dot.x = sin(PI * m/M) * cos( 2 * PI * n/N); //degree or radians?
    dot.y = sin(PI * m/M ) * sin(2 * PI * n/N);
    dot.z = cos(PI * m/M);
    dot = rotate3D(dot, rotateAngle, axis);
    dot.mult(scale);
    vertex(dot.x, dot.y);
    
    }
    
    endShape();
    
    }
    
  }

  stroke(0, 255, 0);
  line(0.0, 0.0, 2*scale*axis.x, 2*scale*axis.y);
  
  endRecord();
  
}

//rotate given vector along arbitary axis for given angle
//in degrees, not radians; axis should be normilized
PVector rotate3D(PVector vert, float angle,PVector axis){

  PVector clone = new PVector(vert.x, vert.y, vert.z);
 
  PMatrix3D rMat = new PMatrix3D();
  rMat.rotate(radians(angle),axis.x,axis.y,axis.z);
  rMat.mult(clone,clone);
  return clone;
  
}
