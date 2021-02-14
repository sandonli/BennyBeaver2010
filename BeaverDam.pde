
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
String[] canadian = {"eh", "maple syrup", "sorry","poutine","Toronto", "Calgary", "lacrosse", "Canada", "Lethbridge", "Edmonton", "Ottawa", "Toronto Raptors", "Justin Trudeau", "Alberta","Victoria",
    "Terry Fox", "kilometers", "polar bear", "beaver", "geese", "Yellowknife", "NorthWest Territories", "Hudson Bay","Quebec","Newfoundland", "Labrador", "Charlottetown", "Saskatoon", "Regina",   
    "hockey", "curling", "Vancouver", "Montreal", "Halifax", "Nova Scotia", "maple leaf", "New Brunswick", "Manitoba", "Saskatchewan", "Railway","UOFC","UOFT","UOFA",
    "Yukon", "Nunavut", "goose", "Tim Hortons", "loonie", "chinook", "RCMP", "toque", "timbits", "UBC", "McGill", "Double Double", "Pop", "Toque", "Chinook","Mountie", "Two Four",
    "Moose", "Canucks", "Cowtown", "Justin Bieber" , "Drake","Justin Beaver","Celine Dion","Avril Lavigne","GSP","Andrew Wiggins","RJ Barrett",
    "Jim Carrey", "Seth Rogen"};
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
            setupLevelScreen(1);
            break;
        case 4:
            // gameOverScreen();
            break;
        case 5:
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,850/2);
            break;
    }
}

boolean once = true;

void keyPressed() {
    if ((key == ENTER) && (once)) {
        mode = 3;
        once = false;
    } else if ((key != BACKSPACE) && (!once)){
        typing += key;
    } else if ((key == BACKSPACE) && (!once)) {
        if (typing != "" && typing.length() > 0) {
            typing = typing.substring(0, typing.length() - 1);
        }
    } else if ((key == ENTER) && (!once)) {

    }
    //     for q in wordsInLevel;
    //         if currentWord == wordsInLevel[q];
    //             remove.wordsInLevel[q]


    
        
}        


