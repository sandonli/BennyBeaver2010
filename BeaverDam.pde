
/*
BeaverDam is the main class which contains the setup() method to start the game
 - Update file name when Game name is determined
*/

// mode 1: intro screen, mode 2: 

PImage log;
PImage bottle;
PImage barrel;
PImage beaver;
PImage damSmall;
PImage damMedium;
PImage damLarge;
PImage waterhole;
PImage introBackground;
PImage levelBackground;
PFont font;
int mode;
PFont introText;
// Create sound files
//SoundFile xyz

void setup() {
    size(850, 850);
    mode = 1;
    introText = createFont("joystix monospace.ttf", 40);
    // log = loadImage();
    // bottle = loadImage();
    // barrel = loadImage();
    // beaver = loadImage();
    // damSmall = loadImage();
    // damMedium = loadImage();
    // damLarge = loadImage();
    // waterhole = loadImage();
    // introBackground = loadImage();
    // levelBackground = loadImage();
}

void draw() {
    switch(mode){
        case 1:
            //introScreen();
            mode = 2;
            break;
        case 2:
            textFont(introText, 40);
            fill(0,0,0);
            textAlign(CENTER);
            text("Press ENTER to Play!", 850/2, 850/2);
            break;
       case 3:
            //levelScreen
            break;
        case 4:
            // gameOverScreen();
            break;
        case 5:
            // levelPassed();
            break;
    }
}