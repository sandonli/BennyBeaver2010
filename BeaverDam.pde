import processing.sound.*; 

/*
BeaverDam is the main class which contains the setup() method to start the game
 - Update file name when Game name is determined
*/

// mode 1: intro screen, mode 2: 

int level;
PImage beaver;
PImage damSmall;
PImage damMedium;
PImage damLarge;
PImage bennyHappy;
PImage bennySad;
PImage [] waterhole = new PImage[30];
PImage[] bennyBeaver = new PImage[30];
PImage[] poof = new PImage[180];
PImage nextLevelSign;
PImage[] intro = new PImage[30];
String factory1 = "Factory_2.png";
String factory2 = "Factory_2b.png";
PImage[] river = new PImage[30];
String filename1 = "river1.png";
String filename2 = "river2.png";
String filename3 = "river3.png";
String waterhole1 = "DamLeak1.png";
String waterhole2 = "DamLeak2.png";
int imageCount = 30;
int imageCount2 =30;
int imageCount3 = 30;
int imageCount4 = 30;
int frame;
int frame2 = 0;
int frame3;
int frame4;
int frame5;
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
boolean once2 = false;
boolean once3 = false;
PFont introText;

String[] canadian = {"eh", "maple syrup", "sorry","poutine","Toronto", "Calgary", "lacrosse", "Canada", "Lethbridge", "Edmonton", "Ottawa", "Raptors", "Justin Trudeau", "Alberta","Victoria",
    "Terry Fox", "kilometers", "polar bear", "beaver", "geese", "Yellowknife", "NorthWest Territories", "Hudson Bay","Quebec","Newfoundland", "Labrador", "Charlottetown", "Saskatoon", "Regina",   
    "hockey", "curling", "Vancouver", "Montreal", "Halifax", "Nova Scotia", "maple leaf", "New Brunswick", "Manitoba", "Saskatchewan", "Railway","U of C","U of T","U of A", "Dalhousie", "Edgemont", "Bowness", "Musqueam", "SAIT",
    "Yukon", "Nunavut", "goose", "Tim Hortons", "loonie", "chinook", "RCMP", "toque", "timbits", "UBC", "McGill", "Pop", "Toque", "Chinook","Mountie", "Two Four","skating","skiing","CalgaryHacks","celcius","pikachu",
    "Moose", "Canucks", "Cowtown", "Justin Bieber" , "Drake","Justin Beaver","Celine Dion", "GSP","Andrew Wiggins","RJ Barrett", "YYC","Trump", "Nosehill", "Elbow River", "dumb blue ring", "Ginger Ale",
    "Jim Carrey", "Stampede", "Seth Rogen", "Moncton", "Quebec City", "Winnipeg", "Flames", "Nenshi", "Shaganappi", "Cold","the","and","you","that","was","for","are","with","his","they","this","have","from","one","had","word","but","not","what","all","were","when","your","can","said","there","use","each","which","she","how","their","will","other","about","out","many","then","them","these","some","her","would","make","like","him","into","time","has","look","two","more","write","go","see","number","no","way","could","people","than","first","water","been","call","who","oil","its","now","find","long","down","day","did","get","come","made","may","part"};

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
    level = 1;
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

    for (int v = 0; v < 30; v++) {
        if (v < 15){
            waterhole[v] = loadImage(waterhole1);
        }
        else {
            waterhole[v] = loadImage(waterhole2);
        }
    }

    for (int z = 0; z < 30; z++) {
        if (z < 15) {
            bennyBeaver[z] = loadImage("BennyBeaver 1.png");
        } else {
            bennyBeaver[z] = loadImage("BennyBeaver 2.png");
        }
    }

    for (int b = 0; b < 180; b++) {
        if (b < 30) {
            poof[b] = loadImage("poof/poof_0.png");
        } else if (b < 60) {
            poof[b] = loadImage("poof/poof_1.png");
        } else if (b < 90) {
            poof[b] = loadImage("poof/poof_2.png");
        } else if (b < 120) {
            poof[b] = loadImage("poof/poof_3.png");
        } else if (b < 150) {
            poof[b] = loadImage("poof/poof_4.png");
        } else {
            poof[b] = loadImage("poof/poof_5.png");
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
    damMedium = loadImage("dam_medium.png");
    damLarge = loadImage("dam_large.png");
    nextLevelSign = loadImage("nextlevel.png");
    bennyHappy = loadImage("Benny Happy.png");
    bennySad = loadImage("Benny Sad.png");
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
            imageMode(CENTER);
            image(bennySad, 850/2, 300);
            textFont(introText, 40);
            fill(100,0,0);
            textAlign(CENTER);
            text("Barry's Dam is Destroyed!\nGAME OVER!",850/2, 700);
            //TODO: Add menu button
            break;
        case 5:
            // Level Pass 1
            // stopSounds();
            // theme.loop();
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,300);
            textFont(introText, 30);
            textAlign(CENTER);
            imageMode(CENTER);
            image(bennyHappy, 850/2, 300);
            imageMode(CENTER);
            image(nextLevelSign, 850/2, 575);
            imageMode(CORNER);
            once2 = true;
            break;
        case 6:
            setupLevelScreen(2);
            break;
        case 7:
            setupLevelScreen(3);
            break;
        case 8:
            // Level Pass 2
            // stopSounds();
            // theme.loop();
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,300);
            textFont(introText, 30);
            textAlign(CENTER);
            imageMode(CENTER);
            image(bennyHappy, 850/2, 300);
            imageMode(CENTER);
            image(nextLevelSign, 850/2, 575);
            imageMode(CORNER);
            once3 = true;
            break;
    }
}

// boolean isNextLevelPressed() {
//     int xLowerBound = 850/2;
//     int xUpperBound = 850/2 + nextLevelSign.width;

//     int yLowerBound = 575;
//     int yUpperBound = 575 + nextLevelSign.height;

//     return (mouseX > xLowerBound && mouseX < xUpperBound && mouseY > yLowerBound && mouseY < yUpperBound);
// }


boolean once = true;

void keyPressed() {
    if ((key == ENTER) && (once)) {
        background(255);
        mode = 3;
        once = false;
    } else if ((key == ENTER) && (once2)) {
        background(255);
        mode = 6;
        once2 = false;
    } else if ((key == ENTER) && (once3)){
        background(255);
        mode = 7;
        once3 = false;
    } else if ((key != BACKSPACE) && (!once)){
        typing += key;
    } else if ((key == BACKSPACE) && (!once)) {
        if (typing != "" && typing.length() > 0) {
            typing = typing.substring(0, typing.length() - 1);
        }
    }
}
    //     for q in wordsInLevel;
    //         if currentWord == wordsInLevel[q];
    //             remove.wordsInLevel[q]           

// void stopSounds() {
//     victory.stop();
//     theme.stop();
//     defeat.stop();
//     explosion.stop();
//     object_hits_dam.stop();
//     poof_smoke.stop();
// }


