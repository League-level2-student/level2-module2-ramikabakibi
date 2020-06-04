//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

  //Add x and y member variables. They will hold the corner location of each segment of the snake.
  int X;
  int Y;

  // Add a constructor with parameters to initialize each variable.
  Segment(int X, int Y) {
    this.X=X;
    this.Y=Y;
  }
  int getX(){
    return X;
  }
  int getY(){
   return Y; 
  }
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment segment; // head
int foodX;
int foodY;
int snakeDirection=UP;
int foodEaten=0;
ArrayList<Segment> s=new ArrayList<Segment>(); // tail



//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  segment=new Segment(100, 100);
  frameRate(15);
  dropFood();
}

void dropFood() {
  foodX=((int)random(50)*10);
  foodY=((int)random(50)*10);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(0, 0, 50);
  drawFood();
  move();
  drawSnake();
  eat();
}

void drawFood() {
  fill(150, 0, 0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  fill(0, 255, 0);
  rect(segment.getX(), segment.getY(), 10, 10);
  manageTail();
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  for(int i=0; i<s.size(); i++){
    // s.get(i) => segment; segment.getX(); s.get(i).getX()
    fill(0,255,0);
    rect(s.get(i).getX(), s.get(i).getY(), 10,10);
  }
}

void manageTail() {
  checkTailCollision();
  drawTail();
   s.add(new Segment(segment.getX(), segment.getY()));
  s.remove(0);
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
}

void checkTailCollision() {
  for(int i=0; i<s.size();i++){
  if(segment.getX() == s.get(i).getX() && segment.getY() == s.get(i).getY() ){
    foodEaten=1;
    s=new ArrayList<Segment>();
    s.add(new Segment(segment.getX(), segment.getY()));
  }
  }
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  if (key==CODED) {
    if (keyCode==UP) {
      if(snakeDirection !=DOWN){
      snakeDirection=UP;
      }
    } 
    else if ( keyCode == DOWN ) {
      if( snakeDirection != UP ){
         snakeDirection=DOWN;
      }
    } else if (keyCode==RIGHT) {
      if(snakeDirection != LEFT){
      snakeDirection=RIGHT;
      }
    } else if (keyCode==LEFT) {
      if(snakeDirection != RIGHT){
      snakeDirection=LEFT;
      }
    }
  }
}

void move() {
 

  switch(snakeDirection) {
  case UP:
    // move head up here 
    segment.Y-=10;
    break;
  case DOWN:
    segment.Y+=10;
    break;
  case LEFT:
    segment.X-=10;
    break;
  case RIGHT:
    segment.X+=10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
  if (segment.X>500) {
    segment.X=0;
  }
  if (segment.X<0) {
    segment.X=500;
  }
  if (segment.Y<0) {
    segment.Y=500;
  }
  if (segment.Y>500) {
    segment.Y=0;
  }
}



void eat() {
  if (segment.X==foodX && segment.Y==foodY) {
    foodEaten++;
    foodX=((int)random(50)*10);
    foodY=((int)random(50)*10);
    s.add(new Segment(segment.getX(), segment.getY()));
  }
}
