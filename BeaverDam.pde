import processing.sound.*; 

/*
BeaverDam is the main class which contains the setup() method to start the game
 - Update file name when Game name is determined
*/

// mode 1: intro screen, mode 2: 

PImage beaver;
PImage damSmall;
PImage damMedium;
PImage damLarge;
PImage [] waterhole = new PImage[30];
PImage = nextLevelSign;
PImage[] intro = new PImage[30];
String factory1 = "Factory_2.png";
String factory2 = "Factory_2b.png";
PImage[] river = new PImage[30];
String filename1 = "river1.png";
String filename2 = "river2.png";
String filename3 = "river3.png";
int imageCount = 30;
int imageCount2 =30;
int frame;
int frame2 = 0;
PFont font;
PImage logInit;
PImage redBarrel;
PImage garbageBagDown;
PImage garbageBagLeft;
PImage garbageBagRight;
PImage garbageBagUp;
PImage skinnyWaterJug;
PImage logInitLong;
int mode;
PFont introText;

String[] canadian = {"eh", "maple syrup", "sorry","poutine","Toronto", "Calgary", "lacrosse", "Canada", "Lethbridge", "Edmonton", "Ottawa", "Toronto Raptors", "Justin Trudeau", "Alberta","Victoria",
    "Terry Fox", "kilometers", "polar bear", "beaver", "geese", "Yellowknife", "NorthWest Territories", "Hudson Bay","Quebec","Newfoundland", "Labrador", "Charlottetown", "Saskatoon", "Regina",   
    "hockey", "curling", "Vancouver", "Montreal", "Halifax", "Nova Scotia", "maple leaf", "New Brunswick", "Manitoba", "Saskatchewan", "Railway","UOFC","UOFT","UOFA",
    "Yukon", "Nunavut", "goose", "Tim Hortons", "loonie", "chinook", "RCMP", "toque", "timbits", "UBC", "McGill", "Double Double", "Pop", "Toque", "Chinook","Mountie", "Two Four",
    "Moose", "Canucks", "Cowtown", "Justin Bieber" , "Drake","Justin Beaver","Celine Dion","Avril Lavigne","GSP","Andrew Wiggins","RJ Barrett",
    "Jim Carrey", "Seth Rogen", "Sydney Crosby", "Moncton", "Quebec City", "Winnipeg", "Flames", "Nenshi", "Shaganappi", "Cold","the","of","and","a","to","in","is","you","that","it","he","was","for","on","are","as","with","his","they","I","at","be","this","have","from","or","one","had","by","word","but","not","what","all","were","we","when","your","can","said","there","use","an","each","which","she","do","how","their","if","will","up","other","about","out","many","then","them","these","so","some","her","would","make","like","him","into","time","has","look","two","more","write","go","see","number","no","way","could","people","my","than","first","water","been","call","who","oil","its","now","find","long","down","day","did","get","come","made","may","part"};

String[] itemSprites = {
    "barrel_red.png",
    "garbage_bag_down.png",
    "garbage_bag_left.png",
    "garbage_bag_right.png",
    "garbage_bag_up.png",
    "skinny_water_jug.png"
};

// SoundFile theme = new SoundFile(this, "Memo Song.wav");
// SoundFile defeat = new SoundFile(this, "defeat.wav");
// SoundFile explosion = new SoundFile(this, "explosion.wav");
// SoundFile object_hits_dam = new SoundFile(this, "object_hits_dam.wav");
// SoundFile poof_smoke = new SoundFile(this, "poof_smoke.wav");
// SoundFile victory = new SoundFile(this, "victory.wav");

void setup() {
    size(850, 850);
    mode = 1;
    introText = createFont("joystix monospace.ttf", 40);
    for (int i = 0; i < 30; i++) {
        if (i < 10) {
            river[i] = loadImage(filename1);
        } else if (i >= 10 && i < 20) {
            river[i] = loadImage(filename2);
        } else {
            river [i] = loadImage(filename3);
        }
    }

    for (int q = 0; q < 30; q++) {
        if (q<15){
            intro[q] = loadImage(factory1);
        }
        else {
            intro[q] = loadImage(factory2);
        }
    }
    redBarrel = loadImage("barrel_red.png");               //1 
    garbageBagDown = loadImage("garbage_bag_down.png");    //2
    garbageBagLeft = loadImage("garbage_bag_left.png");    //3
    garbageBagRight = loadImage("garbage_bag_right.png");  //4
    garbageBagUp = loadImage("garbage_bag_up.png");        //5
    skinnyWaterJug = loadImage("skinny_water_jug.png");    //6
    logInit = loadImage("log_init.png");
    logInitLong = loadImage("log_init_long.png");
    damSmall = loadImage("dam_init.png");
    nextLevelSign = loadImage("nextlevel.png");
    
}

void draw() {
    switch(mode){
        case 1:
            // theme.loop();
            introScreen();
            break;
        case 3:
            setupLevelScreen(1);
            break;
        case 4:
            // Game over
            // stopSounds();
            // defeat.play();
            background(0,0,0);
            textFont(introText, 40);
            fill(100,0,0);
            textAlign(CENTER);
            text("Barry's Dam is Destroyed!\nGAME OVER!",850/2, 850/2);
            //TODO: Add menu button
            break;
        case 5:
            // Level Passs
            // stopSounds();
            // theme.loop();
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,300);
            textFont(introText, 30);
            textAlign(CENTER);

            //TODO: Add next level button
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

// void stopSounds() {
//     victory.stop();
//     theme.stop();
//     defeat.stop();
//     explosion.stop();
//     object_hits_dam.stop();
//     poof_smoke.stop();
// }


