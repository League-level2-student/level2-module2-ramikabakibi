//*
// ***** SEGMENT CLASS *****
// This class will be used to represent each part of the moving snake.
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int X;
int Y;

// Add a constructor with parameters to initialize each variable.
Segment(int X, int Y){
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




//*
// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
size(500,500);
segment=new Segment(100,100);
frameRate(20);
dropFood();
}

void dropFood() {
  foodX=((int)random(50)*10);
  foodY=((int)random(50)*10);
  //ON NUMBER 4. 
    
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  
}

void drawFood() {
  //Draw the food
  
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
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
  //Set the direction of the snake according to the arrow keys pressed
  
}

void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    /*
  switch(direction) {
  case UP:
    // move head up here 
    break;
  case DOWN:
    // move head down here 
    break;
  case LEFT:
   // figure it out 
    break;
  case RIGHT:
    // mystery code goes here 
    break;
  }
  */
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear

}
