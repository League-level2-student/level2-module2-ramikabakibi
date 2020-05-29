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
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
Segment segment;
int foodX;
int foodY;
int snakeDirection=UP;
int foodEaten=0;




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  size(500, 500);
  segment=new Segment(100, 100);
  frameRate(20);
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
}

void drawFood() {
  fill(150, 0, 0);
  rect(foodX, foodY, 10, 10);
}

void drawSnake() {
  fill(0, 150, 0);
  rect(segment.X, segment.Y, 10, 10);
}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail
}

void manageTail() {
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
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
    segment.Y-=5;
    break;
  case DOWN:
    segment.Y+=5;
    break;
  case LEFT:
    segment.X-=5;
    break;
  case RIGHT:
    segment.X+=5;
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
  }
}
