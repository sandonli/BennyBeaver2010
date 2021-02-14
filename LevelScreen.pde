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
void obtainWords(int difficulty) {
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

void displayRiver() {
    deltaTime = 2000;
    previousDisplayTime = 0;

    if (millis() > previousDisplayTime + deltaTime) {
        frame = (frame + 1) % imageCount;
        image(river[frame], 0, 0);
        previousDisplayTime = millis();
    }
}

void changeSpeed(int difficulty) {
    switch(difficulty) {
        case 1:
            break;
        case 2:
            for (Item item : itemsOnScreen) {
                item.ySpeed *= 1.5;
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
void initializeLevelScreen(int difficulty) {
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
            // 
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
        text(item.word, item.xCoord + 20, item.yCoord + 40);
    } else if (item.word.length() > 6) {
        text(item.word, item.xCoord + 5, item.yCoord + 40);
    }
}

void displayTextTrash() {
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
void displayText() {
    //TODO: Ask sandon/jason where text box is and what size it is
    image(textBar, 250, 750);
    fill(0);
    text(typing, 300, 790);
    fill(255);
}

//60fps
void checkIfMatch() {
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




