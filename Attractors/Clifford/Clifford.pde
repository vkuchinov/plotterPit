/*

GINGERBREAD MAN
a chaotic two-dimensional piecewise linear map defined by

  Xn+1 = 1.0 - Yn + |Xn|
  Yn+1 = Xn;

REFERENCES:
http://mathworld.wolfram.com/GingerbreadmanMap.html
http://rosettacode.org/wiki/Map_range


@author Vladimir V. KUCHINOV
@email  helloworld@vkuchinov.co.uk


 for(var i = 0; i < 100; i++){
      var x = Math.random()*5;
      var y = Math.random()*5;
      var xOld;
      for(var j = 0; j < 2000; j++) {
        xOld = x;
        x = 1 - y + Math.abs(x);
        y = xOld;
        ctx.fillRect((x+4)*35, (y+4)*35, 1, 1);
      }
    }
  }
  
*/

float scale = 16.0;

float xn, yn;

void setup(){
  
 size(400, 400);
 translate(width * 0.32, height * 0.32);
   
   for(int j = 0; j < 99; j++){
     
   float x = random(-2, 8);
   float y = random(-2, 8);
   println(x);
   
       for(int i = 0; i < 2048; i++ ){
        
           xn = x;
           
           x = 1.0 - y + Math.abs(x);
           y = xn;
           
           stroke(0);
           strokeWeight(0.75);
           point(x * scale, y * scale);     
           
       }
   }
  
  //filter(BLUR, 4);
  //filter(POSTERIZE, 4);
  
  //feel free too play with post-fx for a better artistic result
   
}
