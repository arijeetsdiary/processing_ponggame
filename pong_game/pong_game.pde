/*
By ARIJEET ROY, (github.com/arijeetsdiary)


E-Thump Game with Marshmello:

Here, Bill is the famous DJ MARSHMELLO
Take the cursor to the extreme right or left to watch him WINK

Reference: Took help from - https://processing.org/reference/
*/

int w, h, textX, textY, cloudX, cloudY, treeX, treeY; 
float x, y, previousY, speedX=2.0, speedY=3.0, gravity=0.1;
int marshX, marshY;

void setup() {
   size (640,480);
   
   w = 40;                  //width of the ball
   h = 40;                  //height of the ball
   x = w/2 + 1;             //x-coordinate of the ball
   y = random (h/2,350);    //y-coordinate of the ball

   marshX = width/2;        //marshmello start point
   
   cloudX = 600;            //cloud start points
   cloudY = 50;
  
   treeX = 5;               //coordinates of trees
   treeY = 300;

}

void draw() {
  background(#4FAEF5);
  
  drawText();
  
  drawTurntable();
  
  drawSun();
  
  drawCloud();
  
  drawGrass();
  
  drawTree();
  
  drawBall();
  
  moveBall();
  
  drawMarshmello();
  
  collision();
}


void drawText() {
  textX = 0;
  textY = 0;
  
  //checks if mouse in range of text and adds motion to text
  if ( (mouseX >=0 && mouseX <= 100) && (mouseY >=100 && mouseY <= 200) ) {
    textX = textX + int ( random (-3,3) );
    textY = textY + int ( random (-3,3) );
  }
  
  //setting text and size
  textSize(40);
  fill(0);
  text("KEEP", textX, textY+140);
  text("IT", textX, textY+170);
  text("MELLO", textX, textY+200);
  
}    //drawText ends here


void drawSun() {
 fill(#F76C25);
 strokeWeight(0.25);
 ellipse(630, 25, 100, 100);    //the sun
 
 stroke(#F76C25);
 strokeWeight(1);
 line(550, 10, 640,0);          //rays of the sun
 line(520, 50, 640,0);
 line(560, 70, 640,0);
 line(580, 110, 640, 0);
 line(620, 100, 640, 0);
}    //drawSun ends here

void drawCloud() {
  fill(255);
  strokeWeight(1);
  stroke(255);
  
  //cloud 5
  ellipse(cloudX, cloudY, 40, 25);
  ellipse(cloudX+20, cloudY+15, 40, 25);
  ellipse(cloudX-10, cloudY+15, 40, 25);
  
  //cloud 4
  ellipse(cloudX-100, cloudY+20, 60, 45);
  ellipse(cloudX-70, cloudY+45, 80, 45);
  ellipse(cloudX-120, cloudY+45, 60, 35);
  
  //cloud 3
  ellipse(cloudX-200, cloudY, 40, 25);
  ellipse(cloudX-180, cloudY+15, 40, 25);
  ellipse(cloudX-220, cloudY+15, 40, 25);
  ellipse(cloudX-200, cloudY+30, 40, 25);
  
  //cloud 2
  ellipse(cloudX+450, cloudY, 40, 25);
  ellipse(cloudX+470, cloudY+15, 40, 25);
  ellipse(cloudX+440, cloudY+15, 40, 25);
  
  //cloud 1
  ellipse(cloudX+350, cloudY+20, 60, 45);
  ellipse(cloudX+370, cloudY+45, 80, 45);
  ellipse(cloudX+330, cloudY+45, 60, 35);
  
  cloudX = cloudX - 1;      //sets clouds in motion
  
  //sets a limit for the clouds to travel to
  if (cloudX == -600) {
   cloudX = 1100;          //brings clouds back to screen after certain interval
  }
}

void drawGrass() {
  strokeWeight(0.5);
  fill(#2CD847);
  rectMode(CENTER);
  rect(width/2, height, 640, 30);
  
}    //drawGrass ends here


void drawTree() {
  
  //small tree
  stroke(#813535);
  strokeWeight(7);
  line(5, 350, 5, 462);    //stem of the tree
  
  //leaves, starting from the lowest
  fill(#358146);
  stroke(#358146);
  triangle(treeX-15, treeY+120, treeX+40, treeY+120, treeX, treeY+70);
  
  fill(#30CE53);
  stroke(#30CE53);
  triangle(treeX-15, treeY+105, treeX+35, treeY+105, treeX, treeY+60);
  
  fill(#358146);
  stroke(#358146);
  triangle(treeX-15, treeY+90, treeX+30, treeY+90, treeX, treeY+50);
  
  fill(#30CE53);
  stroke(#30CE53);
  triangle(treeX-15, treeY+75, treeX+25, treeY+75, treeX, treeY+40);
  
  fill(#358146);
  stroke(#358146);
  triangle(treeX-15, treeY+60, treeX+15, treeY+60, treeX, treeY+30);
  
  //big tree
  stroke(#813535);
  strokeWeight(7);
  line(628, 320, 628, 462);    //stem of the tree
  
  //leaves starting from the lowest
  fill(#358146);
  stroke(#358146);
  triangle(treeX+580, treeY+110, treeX+655, treeY+110, treeX+625, treeY+60);
  
  fill(#30CE53);
  stroke(#30CE53);
  triangle(treeX+580, treeY+95, treeX+660, treeY+95, treeX+625, treeY+50);
  
  fill(#358146);
  stroke(#358146);
  triangle(treeX+585, treeY+80, treeX+665, treeY+80, treeX+625, treeY+40);
  
  fill(#30CE53);
  stroke(#30CE53);
  triangle(treeX+590, treeY+65, treeX+660, treeY+65, treeX+625, treeY+30);
  
  fill(#358146);
  stroke(#358146);
  triangle(treeX+595, treeY+50, treeX+655, treeY+50, treeX+625, treeY+20);
  
  fill(#30CE53);
  stroke(#30CE53);
  triangle(treeX+600, treeY+35, treeX+660, treeY+35, treeX+625, treeY+10);
  
  fill(#358146);
  stroke(#358146);
  triangle(treeX+605, treeY+20, treeX+650, treeY+20, treeX+625, treeY);
  
  //adds motion to leaves
  //treeX = treeX + int ( random (-1.05,1.05) );
  //treeY = treeY + int ( random (-1.05,1.05) );
  
  ////leaves moving due to heavy breeze
  //if ( (treeX > 7) || (treeY > 302) ) {
  //  treeX = 5;
  //  treeY = 300;
  //}
  //else if ( (treeX > treeX+627) || (treeY > treeY+102) ) {
  //  treeX = 5;
  //  treeY = 300;
  //}
}


void drawBall() {
  strokeWeight(0.5);
  fill(255,0,0);
  ellipse(x,y,w,h);
  
}    //drawBall ends here


void moveBall() {  
  
  //forbid ball to exit in x-direction
  if (x >= width - w/2) {
    speedX = speedX * -1;            //reverses direction of the ball
  }
  else if (x <= w/2) {
    speedX = speedX * -1;    
  }
  
  //forbid ball to exit in y-direction
  if (y >= height - (15 + w/2) ) {
    speedY = 3.0;                    //makes ball slower while going up
    speedY = speedY * -1;  
  }
  else if (y < w/2) {
    speedY = speedY * -1;
  }
  
  //moving the ball in both x,y directions
  x = x + speedX;
  previousY = y;        //to compare values of y later
  y = y + speedY;
  
  //checks if ball moving downwards
  if (y > previousY) {
     speedY = speedY + gravity;      //speeds up ball while going down, due to gravity
  }

}  //moveBall ends here


void drawMarshmello() {
  marshX = mouseX;
  marshY = 375;
  
  //adding wink effect at two extreme horizontal positions
  if (marshX >= 590) {
    marshX = 590;
    
    //Marshmello hat
    stroke(0);
    strokeWeight(1.5);
    fill(255);
    rectMode(CENTER);
    rect(marshX, marshY+45, 100, 90, 8);
    
    //Marshmello smile
    strokeWeight(4);
    noFill();
    arc(marshX, marshY+67, 70, 30, 0, PI);
    
    //Marshmello left eyes
    fill(0);
    arc(marshX-25, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX-13, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    triangle(marshX-26, marshY+45, marshX-29, marshY+35, marshX-16, marshY+50);
    triangle(marshX-13, marshY+45, marshX-10, marshY+35, marshX-23, marshY+50);
    
    //Marshmello right eyes
    fill(0);
    arc(marshX+15, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX+27, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    
  }
  else if (marshX <= 50) {
    marshX=50;
    
    //Marshmello hat
    stroke(0);
    strokeWeight(1.5);
    fill(255);
    rectMode(CENTER);
    rect(marshX, marshY+45, 100, 90, 8);
    
    //Marshmello smile
    strokeWeight(4);
    noFill();
    arc(marshX, marshY+67, 70, 30, 0, PI);
    
    //Marshmello left eyes
    fill(0);
    arc(marshX-25, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX-13, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    triangle(marshX-26, marshY+45, marshX-29, marshY+35, marshX-16, marshY+50);
    triangle(marshX-13, marshY+45, marshX-10, marshY+35, marshX-23, marshY+50);
    
    //Marshmello right eyes
    fill(0);
    arc(marshX+15, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX+27, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    }
  else {
    //Marshmello hat
    stroke(0);
    strokeWeight(1.5);
    fill(255);
    rectMode(CENTER);
    rect(marshX, marshY+45, 100, 90, 8);
    
    //Marshmello smile
    strokeWeight(4);
    noFill();
    arc(marshX, marshY+67, 70, 30, 0, PI);
    
    //Marshmello left eyes
    fill(0);
    arc(marshX-25, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX-13, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    triangle(marshX-26, marshY+45, marshX-29, marshY+35, marshX-16, marshY+50);
    triangle(marshX-13, marshY+45, marshX-10, marshY+35, marshX-23, marshY+50);
    
    //Marshmello right eyes
    fill(0);
    arc(marshX+15, marshY+50, 10, 10, 0, 1.25*PI, CHORD);
    arc(marshX+27, marshY+50, 10, 10, -0.25*PI, PI, CHORD);
    triangle(marshX+14, marshY+45, marshX+11, marshY+35, marshX+24, marshY+50);
    triangle(marshX+27, marshY+45, marshX+30, marshY+35, marshX+15, marshY+50);
  }
}    //drawMarshmello ends here


void drawTurntable() {
  fill(255);
  strokeWeight(1);
  rect(78, 230, 150, 20, 3);   //structure of turntable
  strokeWeight(0.5);
  fill(0);
  rect(35, 220, 40, 8, 3);    //rotating disc
  rect(125, 220, 40, 10, 3);
  fill(0);
  rect(65, 220, 5, 5);      //control buttons
  rect(80, 220, 5, 5);
  rect(95, 220, 5, 5);
}    //drawTurntable ends here


void collision() {
  
  //checks if right half of the ball collides with the hat
  if ( (x+w/2 >= mouseX-51 && x+w/2 <= mouseX+51) && y+h/2 >=marshY ) {
    speedY = 3.0;              //makes ball slower while going up
    speedY = speedY * -1;      //reverses ball direction
  }
  //checks if left half of the ball collides with the hat
  else if ( (x-w/2 >= mouseX-51 && x-w/2 <= mouseX+51) && y+h/2 >=marshY ) {
    speedY = 3.0;
    speedY = speedY * -1;      //reverses ball direction
  }
  
  //checks if ball collides with ground
  else if (y+h/2 >= height-15) {
    speedY = 3.0;
    speedY = speedY * -1;
  }
}    //collision ends here
