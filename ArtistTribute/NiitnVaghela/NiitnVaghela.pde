/*

Tribute to Nitin B. Vaghela
with Curve-Stitching parabolas

*/

ArrayList<Segment> tests = new ArrayList();
float radius = 300.0;
int sides = 6;

void setup() {

  size(750, 750, "processing.core.PGraphicsRetina2D");
  translate(width/2, height/2);

  for (float p = 0.0; p < sides; p++) {

    float x1 = sin(radians(360.0 / sides * p)) * radius; 
    float y1 = cos(radians(360.0 / sides * p)) * radius; 

    float x2 = sin(radians(360.0 / sides * (p - 1))) * radius; 
    float y2 = cos(radians(360.0 / sides * (p - 1))) * radius; 

    float x3 = sin(radians(360.0 / sides * (p + 1))) * radius; 
    float y3 = cos(radians(360.0 / sides * (p + 1))) * radius; 

    //Segment n = new Segment(new PVector(x1, y1), new PVector(x2, y2), new PVector(x3, y3));
    //tests.add(n);
    
    Segment n = new Segment(new PVector(0, 0), new PVector(x2, y2), new PVector(x3, y3));
    tests.add(n);

    n = new Segment(new PVector(x1, y1), new PVector(0, 0), new PVector(x2, y2));
    tests.add(n);
    
    n = new Segment(new PVector(x1, y1), new PVector(0, 0), new PVector(x3, y3));
    tests.add(n);
    
  }

  for (int s = 0; s < tests.size (); s++) {
    tests.get(s).draw();
  }
}

class Segment {

  int steps = 32;

  PVector center;
  PVector[] edges = new PVector[2];

  Segment(PVector c_, PVector p1_, PVector p2_) {

    center = c_;
    edges[0] = p1_;
    edges[1] = p2_;
  } 

  void draw() {

    strokeWeight(3.0);
    line(center.x, center.y, edges[0].x, edges[0].y);
    line(center.x, center.y, edges[1].x, edges[1].y);  

    for (int l = 2; l < steps; l++) {

      PVector p1 = new PVector(edges[0].x, edges[0].y);
      PVector p2 = new PVector(edges[1].x, edges[1].y);

      p1.lerp(center, 1.0/steps * l);
      p2.lerp(center, 1.0 - 1.0/steps * l);

      strokeWeight(map(l, 2, steps, 0.1, 0.8));
      line(p1.x, p1.y, p2.x, p2.y);
    }
  }
}

