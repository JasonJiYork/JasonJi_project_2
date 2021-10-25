//Matching colors game
//By: Jason Ji
//backgrounds from https://coolbackgrounds.io/ and https://wallpaperaccess.com/cool-white
PImage background, background1;
int stage;
PFont title, instructions, start;
String header = "Welcome to Matching Game!";
String instructions1 = "How to play:";
String instructions2 = "When you start, there will be the name of a color on your screen";
String instructions3 = "There will also be a constantly changing picture";
String instructions4 = "When the color on your screen matches the picture, press spacebar to move to the next color";
String instructions5 = "If you press space when the color does not match the picture nothing will happen";
String instructions6 = "It's ok to miss when they match, the opportunity will come around again";
String instructions7 = "The game ends once you have gone through all the colors";
String instructions8 = "Good Luck!";
String instructions9 = "Press s to start!";
String won = "Congratulations you have won!";
String[] colors = {"Red", "Green", "Blue", "Yellow", "Purple", "Orange"};
String[] imageNames = {"red.PNG", "green.PNG", "blue.PNG", "yellow.PNG", "purple.PNG", "orange.PNG", "brown.PNG", "black.PNG", "grey.PNG", "pink.PNG"};
PImage[] images = new PImage[imageNames.length];
int imageCounter = 0;
int colorCounter = 0;
int points = 0;
int displayTime = 1000;
int lastTime;

void setup() {
  stage = 1;
  size(1000, 600, P2D);
  background = loadImage("background.png");
  background.resize(width, height);
  background1 = loadImage("background1.jpg");
  background1.resize(width, height);
  title = createFont("Candara", 60);
  instructions = createFont("Candara", 20);
  start = createFont("Candara", 40);
  for (int i = 0; i < imageNames.length; i++) {
    images[i] = loadImage(imageNames[i]);
    images[i].resize(375, 375);
  }
  lastTime = millis();
}

void draw() {
  background(background);
  if (stage == 1) {
    textAlign(LEFT);
    fill(0, 0, 0);
    textFont(title);
    text(header, 15, 60);
    textFont(instructions);
    text(instructions1, 15, 100);
    text(instructions2, 15, 125);
    text(instructions3, 15, 150);
    text(instructions4, 15, 175);
    text(instructions5, 15, 200);
    text(instructions6, 15, 225);
    text(instructions7, 15, 250);
    text(instructions8, 15, 275);
    textAlign(CENTER);
    textFont(start);
    text(instructions9, width/2, 500);
  }
  if (stage == 2) {
    //game goes here
    background(background1);
    textAlign(CENTER);
    imageMode(CENTER); 
    text("Color:", width/2, 60);

    if (colorCounter < colors.length) {
      text(colors[colorCounter], width/2, 110);
    }else{
      stage=3;
    }
    if (millis() - lastTime >= displayTime) { // Time to display next image
      imageCounter = int(random(0, 10));
      lastTime = millis();
    }
    image(images[imageCounter], width/2, 350);
  }//stage==2
  if (stage == 3){
    background(background);
    textAlign(CENTER);
    textFont(start);
    text(won, width/2, 500);
  }
  
}//draw

void keyPressed() {
  if (key == 's'){
  stage = 2;
  }
  if (key == ' ' && imageCounter == colorCounter){
  colorCounter++;
  }
}
