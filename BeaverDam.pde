
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
int mode;
// Create sound files
//SoundFile xyz
Screens screen;

void setup() {
    size(850, 850);
    mode = 3;
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
            screen.introScreen();
            break;
        case 2:
            screen.mainMenu();
            break;
        case 3:
            typeWord();
            break;
        case 4:
            // gameOverScreen();
            break;
        case 5:
            // levelPassed();
            break;
    }
}