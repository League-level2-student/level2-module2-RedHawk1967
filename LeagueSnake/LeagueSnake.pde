//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

Segment(int x,int y) {
this.x = x;
this.y = y;
}
// Add a constructor with parameters to initialize each variable.


}

void LeagueSnake() { }
//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int direction = UP;
int foodCount = 0;
Segment shead;
int foodX;
int foodY;
//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
background(0,0,0);
  size(500,500);
shead = new Segment(10,10);
frameRate(20);
dropFood();

}

void dropFood() {
  //Set the food in a new random location
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0,0,0);
  move();
  drawFood();
  drawSnake();
  eat();

}

void drawFood() {
  //Draw the food
  fill(255,0,0);
  rect(foodX,foodY,10,10);
  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  fill(0,255,0);
  rect(shead.x,shead.y ,10,10);
  manageTail();

}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(int i = 0; i < tail.size(); i++) {
rect(tail.get(i).x,tail.get(i).y,10,10);

}
}

ArrayList<Segment> tail = new ArrayList<Segment>();


void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  checkTailCollision();
  drawTail();
  Segment seg = new Segment(shead.x,shead.y);
  tail.add(seg);
  tail.remove(0);
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
   
  if(shead.x = tail.get(1|| shead.y ) {
  foodCount=1;
  tail.clear();
  Segment seg = new Segment(shead.x,shead.y);
tail.add(seg);
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
  if(keyCode == UP) 

{ direction = UP;}
   
  else if(keyCode == DOWN) 

{ direction = DOWN; }

  else if(keyCode == RIGHT)

{ direction = RIGHT;}

  else if(keyCode == LEFT) {direction = LEFT;}


}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(direction) {
  case UP:
    shead.y-=10;
    checkBoundaries();  
    break;
  case DOWN:
   shead.y+=10;
   checkBoundaries();   
    break;
  case LEFT:
   shead.x-=10;;
   checkBoundaries();  
    break;
  case RIGHT:
    shead.x+=10; 
    checkBoundaries();  
    break;
    
}
  
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(shead.x > 500) {
 shead.x=0; 
 }
 if(shead.y > 500) {
   shead.y=0;
 }
  if(shead.x < 0) {
    shead.x=500;
  }
  if(shead.y < 0) {
    shead.y =500;
  }

}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
if(shead.x == foodX && shead.y == foodY) { dropFood(); foodCount++;
Segment seg = new Segment(shead.x,shead.y);
tail.add(seg);
}

}
