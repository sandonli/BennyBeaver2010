// Gif river;
//PImage[] river = new PImage[3];
PImage damImage;
int previousDisplayTime;
int deltaTime;

// boolean isDuplicate;

ArrayList<Item> itemsInLevel = new ArrayList();
ArrayList<Item> itemsOnScreen = new ArrayList();
int logCount = 0; //# of logs the player has clicked

int wordCount = 0;
boolean test = true;
boolean sad = true;
PFont levelScreenFont;
String typing = "";
GameState gs = new GameState();

//Initializes itemsInLevel
void obtainWords(int difficulty){
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

PImage randomItem(String word) {
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

boolean itemIsValid(Item item) {
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
void setupLevelScreen(int difficulty) {
    background(255);
    displayRiver();
    if (wordCount == 30) {
        mode = 5;
    }
    levelScreenFont = createFont("joystix monospace.ttf", 20);
    textFont(levelScreenFont, 20);
    obtainWords(difficulty);
    if (sad) initializeLevelScreen(difficulty);
    // updateItemsOnScreen();
    moveItems();
    checkCollisions();
    displayTextTrash();
    displayText();
    checkIfMatch();
    checkIfGameOver();
}

void displayRiver() {
    deltaTime = 2000;
    previousDisplayTime = 0;

    if (millis() > previousDisplayTime + deltaTime) {
        frame = (frame + 1) % imageCount;
        image(river[frame], 0, 0);
        previousDisplayTime = millis();
    }
}

//60fps
void initializeLevelScreen(int difficulty) {
    //Set background image value
    gs.lives = 3;
    switch(difficulty) {
        case 1:
            gs.damHeight = 196;
            damImage = damSmall;
            break;
        case 2:
            //TODO: Fill in damHeight
            //TODO: Assign damMedium
            break;
        case 3:
            //TODO: Fill in damHeight
            //TODO: Assign damLarge
            break;
        default:
            break;
    }
    sad = false;
}

// 60fps
void updateItemsOnScreen() {
    for (Item item : itemsInLevel) {
        if (item.yCoord >= 0 && itemsOnScreen.size() < 4) {
            itemsOnScreen.add(item);
        }
    }
}

//60fps
void moveItems() {
    for (Item item : itemsOnScreen) {
        item.yCoord += item.ySpeed;
        // text(item.word, item.xCoord, item.yCoord);
    }
}

//60fps
void checkCollisions() {
    int indexToBeRemoved = -1;
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        if (item.yCoord >= 850 - gs.damHeight) {
            gs.lives = gs.lives - 1;
            indexToBeRemoved = i;
            break;
        }
    }
    if (indexToBeRemoved != -1) {
        itemsOnScreen.remove(indexToBeRemoved);
        typing="";
    }
}

void positionText(Item item) {
    if (item.word.length() >= 4 && item.word.length() <= 6) {
        text(item.word, item.xCoord + 60, item.yCoord + 40);
    } else if (image.word.length() > 6) {
        text(item.word, item.xCoord + 20, item.yCoord + 40);
    }
}

void displayTextTrash() {
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        item.image.resize(160, 80);
        image(item.image, item.xCoord, item.yCoord);
        positionText(item);
        // text(item.word, item.xCoord + 80, item.yCoord + 40);
    }
    test = false;
}

//60fps
void displayText() {
    //TODO: Ask sandon/jason where text box is and what size it is
    text(typing, 425, 650);
}

//60fps
void checkIfMatch() {
    int indexToBeRemoved = -1;
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        if (item.word.equalsIgnoreCase(typing)) {
            item.writeWord();
            indexToBeRemoved = i;
            break;
            // itemsOnScreen.remove(item);
        }
    }
    if (indexToBeRemoved != -1) {
        itemsOnScreen.remove(indexToBeRemoved);
        typing = "";
        wordCount++;
        test = true;
    }
}

//60fps
void checkIfGameOver() {
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




