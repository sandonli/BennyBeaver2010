import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BennieBeaver2010 extends PApplet {

 

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
PImage endscene;
PImage textBar;
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

SoundFile theme;
SoundFile defeat;
SoundFile object_hits_dam;
SoundFile victory;

String[] canadian = {"eh", "maple syrup", "sorry","poutine","Toronto", "Calgary", "lacrosse", "Canada", "Lethbridge", "Edmonton", "Ottawa", "Raptors", "Justin Trudeau", "Alberta","Victoria",
    "Terry Fox", "kilometers", "polar bear", "beaver", "geese", "Yellowknife", "NW Territories", "Hudson Bay","Quebec","Newfoundland", "Labrador", "Charlottetown", "Saskatoon", "Regina",   
    "hockey", "curling", "Vancouver", "Montreal", "Halifax", "Nova Scotia", "maple leaf", "New Brunswick", "Manitoba", "Saskatchewan", "Railway","U of C","U of T","U of A", "Dalhousie", "Edgemont", "Bowness", "Musqueam", "SAIT",
    "Yukon", "Nunavut", "goose", "Tim Hortons", "loonie", "chinook", "RCMP", "toque", "timbits", "UBC", "McGill", "Pop", "Toque", "Chinook","Mountie", "Two Four","skating","skiing","CalgaryHacks","celcius","pikachu",
    "Moose", "Canucks", "Cowtown", "Justin Bieber" , "Drake","Justin Beaver","Celine Dion", "GSP","Wiggins","RJ Barrett", "YYC","Trump", "Nosehill", "Elbow River", "dumb blue ring", "Ginger Ale",
    "Jim Carrey", "Stampede", "Seth Rogen", "Moncton", "Quebec City", "Winnipeg", "Flames", "Nenshi", "Shaganappi", "Cold","the","and","you","that","was","for","are","with","his","they","this","have","from","one","had","word","but","not","what","all","were","when","your","can","said","there","use","each","which","she","how","their","will","other","about","out","many","then","them","these","some","her","would","make","like","him","into","time","has","look","two","more","write","go","see","number","no","way","could","people","than","first","water","been","call","who","oil","its","now","find","long","down","day","did","get","come","made","may","part"};

String[] itemSprites = {
    "barrel_red.png",
    "garbage_bag_down.png",
    "garbage_bag_left.png",
    "garbage_bag_right.png",
    "garbage_bag_up.png",
    "skinny_water_jug.png"
};


// SoundFile explosion = new SoundFile(this, "explosion.wav");
// SoundFile poof_smoke = new SoundFile(this, "poof_smoke.wav");


public void setup() {
    level = 1;
    
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
    textBar = loadImage("Back.png");
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
    endscene = loadImage("endscene.png");

    theme = new SoundFile(this, "Memo Song.wav");
    defeat = new SoundFile(this, "defeat.wav");
    object_hits_dam = new SoundFile(this, "object_hits_dam.wav");
    victory = new SoundFile(this, "victory.wav");
}

public void draw() {
    switch(mode){
        case 1:
            stopSounds();
            theme.loop();
            introScreen();
            break;
        case 3:
            setupLevelScreen(1);
            break;
        case 4:
            // Game over
            stopSounds();
            defeat.play();
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
            stopSounds();
            theme.loop();
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,300);
            textFont(introText, 30);
            textAlign(CENTER);
            textAlign(CORNER);
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
            stopSounds();
            theme.loop();
            background(255);
            textFont(introText,40);
            textAlign(CENTER);
            text("Congratulations!\n You've saved Barry's Dam!", 850/2,300);
            textFont(introText, 30);
            textAlign(CENTER);
            textAlign(CORNER);
            imageMode(CENTER);
            image(bennyHappy, 850/2, 300);
            imageMode(CENTER);
            image(nextLevelSign, 850/2, 575);
            imageMode(CORNER);
            once3 = true;
            break;
        case 9:
            image(endscene,0,0);
            victory.play();
            break;
    }   

}

boolean once = true;

public void keyPressed() {
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
    } else if ((key != CODED)&&(key != BACKSPACE) && (!once)&&(key != ENTER)){
        if(typing.length()>0||key !=' ' ){
        typing += key;
      }
    } else if ((key == BACKSPACE) && (!once)) {
        if (typing != "" && typing.length() > 0) {
            typing = typing.substring(0, typing.length() - 1);
        }
    }
}
    //     for q in wordsInLevel;
    //         if currentWord == wordsInLevel[q];
    //             remove.wordsInLevel[q]           

public void stopSounds() {
    victory.stop();
    theme.stop();
    defeat.stop();
    // explosion.stop();
    object_hits_dam.stop();
    // poof_smoke.stop();
}
class GameState {
    static final int screenWidth = 850;
    static final int screenHeight = 850;
    //TODO: Ask sandon/jason what the dam height image is
    int damHeight; //height of dam in px

    int level; //1-4
    int lives; //0-3
    boolean gameInProcess; //true - user is playing
                           //false - user is not playing

    GameState() {
        this.lives = 3;
    }
}
class Item {
    String word; //word on the item
    
    boolean written = false; //whether the word has been written by the user yet or not
                             // false - render item on screen with word
                             // true - make item disappear
    int numWritten = 0;
    //the number of letters of the word written successfully

    //TODO: What are the horizontal px boundaries of the River?
    float xCoord = random(125, 450); //horizontal pos of item
    float yCoord = random(-500, 0); //vertical pos of item, initially 0 (top of screen)
    float ySpeed = 1.25f; // speed of item falling

    int width; //width of item
    int height; //height of item

    PImage image; //image associated with item

    Item(String word, PImage image) {
        this.word = word;
        this.image = image;
        this.width = image.width;
        this.height = image.height;
    }
    
    public void writeWord() {
        written = true;
        //TODO: Create POOF animation sprite here for when item disappears
    }

    //Setters and Getters

    
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Item))
            return false;
        Item other = (Item)o;
        boolean word = (this.word == null && other.word == null)
        || (this.word != null && this.word.equals(other.word));
        return this.xCoord == other.xCoord && word;
    }

    @Override
    public final int hashCode() {
        int result = 17;
        if (word != null) {
            result = 31 * result + word.hashCode();
        }
        return result;
    }
}
// Gif river;
// PImage[] river = new PImage[3];
PImage damImage;
int previousDisplayTime;
int deltaTime;

ArrayList<Item> itemsInLevel = new ArrayList();
ArrayList<Item> itemsOnScreen = new ArrayList();
int logCount = 0; //# of logs the player has clicked

int wordCount = 0;
int previousDisplayTime3;
int deltaTime3;
boolean test = true;
boolean sad = true;
PFont levelScreenFont;
String typing = "";
GameState gs = new GameState();

boolean life1 = true;
boolean life2 = true;

//Initializes itemsInLevel
public void obtainWords(int difficulty) {
    switch(difficulty) {
        case 1:
            
            PImage p1 = loadImage("barrel_red.png");
            int randomCanadianWordIndex = floor(random(0, canadian.length));
            if (itemsOnScreen.size() < 20) {
                String word = canadian[randomCanadianWordIndex];
                p1 = randomItem(word);
                Item item = new Item(canadian[randomCanadianWordIndex], p1);
                // for (Item itemK : itemsOnScreen) {
                //     String word34 = itemK.word;
                //     if (word34.equals(item.word)) {
                //         isDuplicate = true;
                //         break;
                //     }
                // }
                
                if (itemIsValid(item)) itemsOnScreen.add(item);
            
            }
            break;
        case 2:
            PImage p2 = loadImage("barrel_red.png");
            int randomCanadianWordIndex2 = floor(random(0, canadian.length));
            if (itemsOnScreen.size() < 40) {
                String word2 = canadian[randomCanadianWordIndex2];
                p2 = randomItem(word2);
                Item item2 = new Item(canadian[randomCanadianWordIndex2], p2);
                // for (Item itemF : itemsOnScreen) {
                //     String word46 = itemF.word;
                //     if (word46.equals(item2.word)) {
                //         isDuplicate = true;
                //         break;
                //     }
                // }
                if (itemIsValid(item2)) itemsOnScreen.add(item2);
        
            }
            break; 
        case 3:
            PImage p3 = loadImage("barrel_red.png");
            int randomCanadianWordIndex3 = floor(random(0, canadian.length));
            if (itemsOnScreen.size() < 60) {
                String word3 = canadian[randomCanadianWordIndex3];
                p3 = randomItem(word3);
                Item item3 = new Item(canadian[randomCanadianWordIndex3], p3);
                if (itemIsValid(item3)) itemsOnScreen.add(item3);

            }
            break;
        default:
            break;
    }
}

public PImage randomItem(String word) {
    int randomNum = -1;
    if (word.length() <= 4) {
        randomNum = floor(random(1, 5));
    } else if (word.length() <= 6) {
        randomNum = floor(random(5, 9));
    } else {
        randomNum = 69;
    }

    switch(randomNum) {
        case 1:
            return garbageBagDown;
        case 2:
            return garbageBagUp;
        case 3:
            return garbageBagRight;
        case 4:
            return garbageBagLeft;
        case 5:
            return redBarrel;
        case 6:
            return logInit;
        case 7:
            return skinnyWaterJug;
        case 69:
            return logInitLong;
        default:
            return redBarrel;
    }
}

public boolean itemIsValid(Item item) {
    boolean isValid = true;
    for (Item it : itemsOnScreen) {
        if (it.xCoord < item.xCoord + item.width && it.xCoord + width > item.xCoord && it.yCoord < item.yCoord + item.height && it.yCoord + it.height > item.yCoord) {
            isValid = false;
            break;
        } 
    }
    return isValid;
}

//60fps - called in draw() method 

//60fps
// main entry point method for this screen
public void setupLevelScreen(int difficulty) {
    background(255);
    displayRiver();
    obtainWords(difficulty);
    initializeLevelScreen(difficulty);
    if (difficulty == 1) {
        if (wordCount == 20) {
        
            mode = 5;
        }        
    } else if (difficulty == 2) {
        if (wordCount == 40) {
            mode = 8;
        }
    } else {
        if (wordCount == 60) {
            mode = 9; // winning mode
        }
    }
    levelScreenFont = createFont("joystix monospace.ttf", 20);
    textFont(levelScreenFont, 20);
    // updateItemsOnScreen();
    moveItems();
    checkCollisions();
    displayTextTrash();
    displayText();
    checkIfMatch();
    checkIfGameOver();
}

public void displayRiver() {
    deltaTime = 2000;
    previousDisplayTime = 0;

    if (millis() > previousDisplayTime + deltaTime) {
        frame = (frame + 1) % imageCount;
        image(river[frame], 0, 0);
        previousDisplayTime = millis();
    }
}

public void changeSpeed(int difficulty) {
    switch(difficulty) {
        case 1:
            break;
        case 2:
            for (Item item : itemsOnScreen) {
                item.ySpeed *= 1.5f;
            }
            break;
        case 3:
            for (Item item : itemsOnScreen) {
                item.ySpeed *= 2;
            }
            break;
        default:
            break;
    }
}

//60fps
public void initializeLevelScreen(int difficulty) {
    //Set background image value
    switch(difficulty) {
        case 1:
            gs.damHeight = 196;
            damImage = damSmall;
            changeSpeed(1);
            break;
        case 2:
            if (life1) {
                gs.lives = 3;
                life1 = false;
            }
            gs.damHeight = 236;
            wordCount = 0;
            // itemsOnScreen = new ArrayList();
            damImage = damMedium;
            // changeSpeed(2);
            break;
        case 3:
            gs.damHeight = 317;
            damImage = damLarge;
            wordCount = 0;
            itemsOnScreen = new ArrayList();
            // changeSpeed(3);
            break;
        default:
            break;
    }
    deltaTime = 2000;
    previousDisplayTime = 0;

    if (millis() > previousDisplayTime + deltaTime) {
        frame4 = (frame4 + 1) % imageCount4;
        image(bennyBeaver[frame4], 640, 600);
        previousDisplayTime = millis();
    }
    image(damImage, 135, 855-gs.damHeight);
    sad = false;
}

// 60fps
public void updateItemsOnScreen() {
    for (Item item : itemsInLevel) {
        if (item.yCoord >= 0 && itemsOnScreen.size() < 4) {
            itemsOnScreen.add(item);
        }
    }
}

//60fps
public void moveItems() {
    for (Item item : itemsOnScreen) {
        item.yCoord += item.ySpeed;
        // text(item.word, item.xCoord, item.yCoord);
    }
}

//60fps
public void checkCollisions() {
    int indexToBeRemoved = -1;
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        if (item.yCoord >= 850 - gs.damHeight) {
            gs.lives = gs.lives - 1;
            indexToBeRemoved = i;
            // waterleak was here did not work
            break;
        }
    }
    if (indexToBeRemoved != -1) {                       //       WE SHOULD INDENT IN ONE TO CHECK IF IT WORKS
        itemsOnScreen.remove(indexToBeRemoved);
        object_hits_dam.play();
        object_hits_dam.stop();
        
        frame3 = (frame3 + 1) % 30;
        image(waterhole[frame3], 400, 800);

        typing="";
    
    }
}

public void positionText(Item item) {
    if (item.word.length() >= 4 && item.word.length() <= 6) {
        text(item.word, item.xCoord + 20, item.yCoord + 40);
    } else if (item.word.length() > 6) {
        text(item.word, item.xCoord + 5, item.yCoord + 40);
    }
}

public void displayTextTrash() {
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        item.image.resize(160, 80);
        image(item.image, item.xCoord, item.yCoord);

        if (item.word.length() < 4) {
            text(item.word, item.xCoord + 63, item.yCoord + 40);
        } else {
            positionText(item);
        }
    }
    test = false;
}

//60fps
public void displayText() {
    //TODO: Ask sandon/jason where text box is and what size it is
    image(textBar, 250, 750);
    fill(0);
    text(typing, 300, 780);
    fill(255);
}

//60fps
public void checkIfMatch() {
    int indexToBeRemoved = -1;
    // Item removedItem = null;
    // float removedXCoord = -1;
    // float removedYCoord = -1;
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        if (item.word.equalsIgnoreCase(typing)) {
            // removedItem = item;
            // removedXCoord = item.xCoord;
            // removedYCoord = item.yCoord;
            item.writeWord();
            indexToBeRemoved = i;
            break;
            // itemsOnScreen.remove(item);
        }
    }
    if (indexToBeRemoved != -1) {
        itemsOnScreen.remove(indexToBeRemoved);
        typing = "";
        
        
        // deltaTime = 2000;
        // previousDisplayTime = 0;

        // if (millis() > previousDisplayTime + deltaTime) {
        // frame5 = (frame5 + 1) % 180;
        // image(poof[frame5], removedXCoord, removedYCoord);
        // print(removedXCoord);
        // print(removedYCoord);
        // previousDisplayTime = millis();
            
        // }

        wordCount++;

    }
}

//60fps
public void checkIfGameOver() {
    if (gs.lives == 0) {
        mode = 4;
    }
}

// void checkIfGameWon() {
//     if (logs == 3) {
//         mode = 5;
//     }
// }

// void keyPressed(){
//     typing += key;
// }
class Log extends Item {

    Log(String word, PImage image) {
        super(word, image);
    }




}   
int previousDisplayTime2;
int deltaTime2;


public void introScreen(){
    deltaTime2 = 2000;
    previousDisplayTime2 = 0;

    if (millis() > previousDisplayTime2 + deltaTime2) {
        frame2 = (frame2 + 1) % imageCount2;
        image(intro[frame2], 0, 0);
        previousDisplayTime2 = millis();
    }


}
class Trash extends Item {
    
    Trash(String word, PImage image) {
        super(word, image);
    }

}

// CALL WHEN COLLISION OCCURS ***
// IN IMAGES X AND Y VARIABLE FOR COLLISION COORDINATES
public void waterLeak(){
    deltaTime3 = 2000;
    previousDisplayTime3 = 0;

    if (millis() > previousDisplayTime3 + deltaTime3) {
        frame3 = (frame3 + 1) % imageCount3;
        image(waterhole[frame3], 400, 800);
        previousDisplayTime3 = millis();
    }
}


ArrayList<String> Words = new ArrayList<String>();
String curr;

// for()

// while(i < len(curr)){
    
//     if(keyPressed()){

//         if(key == curr[i]){
//             i++;
//             // TODO: underscore to the right by one
//         }
//         else{
//            // tell user what they typed is wrong 
//         }
//     }
// }

//Function checks if passed character matches expected typed character for the item
// boolean doesKeyWork(char x, Item item){
//     int i = item.num_written;
//     String word = item.word;
//     return x == word.charAt(i);
// }

// String[] canadian = {"eh", "maple syrup", "sorry","poutine","Toronto", "Calgary", "lacrosse", "Canada", "Lethbridge", "Edmonton", "Ottawa", "Toronto Raptors", "Justin Trudeau", "Alberta","Victoria",
// "Terry Fox", "kilometers", "polar bear", "beaver", "geese", "Yellowknife", "NorthWest Territories", "Hudson Bay","Quebec","Newfoundland", "Labrador", "Charlottetown", "Saskatoon", "Regina",
//     "hockey", "curling", "Vancouver", "Montreal", "Halifax", "Nova Scotia", "maple leaf", "New Brunswick", "Manitoba", "Saskatchewan", "Railway","UOFC","UOFT","UOFA",
//     "Yukon", "Nunavut", "goose", "Tim Hortons", "loonie", "chinook", "RCMP", "toque", "timbits", "UBC", "McGill", "Double Double", "Pop", "Toque", "Chinook","Mountie", "Two Four",
//     "Moose", "Canucks", "Cowtown", "Justin Bieber" , "Drake","Justin Beaver","Celine Dion","Avril Lavigne","GSP","Andrew Wiggins","RJ Barrett",
//     "Jim Carrey", "Seth Rogen"}
  public void settings() {  size(850, 850); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--hide-stop", "BennieBeaver2010" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
