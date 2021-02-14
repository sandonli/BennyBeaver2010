PImage background; //TODO: Load the level screen background image

ArrayList<Item> itemsInLevel = new ArrayList();
ArrayList<Item> itemsOnScreen = new ArrayList();
int logCount = 0; //# of logs the player has collected
int wordCount = 0;
boolean test = true;
PFont levelScreenFont;
String typing = "";
GameState gs = new GameState();

//Initializes itemsInLevel
void obtainWords(int difficulty){
    switch(difficulty) {
        case 1:
            PImage p1 = loadImage("barrel_red.png");
            int randomCanadianWordIndex = floor(random(0, 72));
            if (itemsOnScreen.size() < 30) {
                Item item = new Item(canadian[randomCanadianWordIndex], p1);
                if (!itemsOnScreen.contains(item)) {
                    itemsOnScreen.add(item);
                }
            }
            // if (itemsOnScreen.size() < 4) {
            //     PImage p1 = loadImage("barrel_red.png");
            //     PImage p2 = loadImage("barrel_red.png");
            //     PImage p3 = loadImage("barrel_red.png");
            //     PImage p4 = loadImage("barrel_red.png");

            //     Item i1 = new Item("juice", p1);
            //     Item i2 = new Item("chess", p2);
            //     Item i3 = new Item("beaver", p3);
            //     Item i4 = new Item("churchill", p4);
            //     itemsOnScreen.add(i1);
            //     itemsOnScreen.add(i2);
            //     itemsOnScreen.add(i3);
            //     itemsOnScreen.add(i4);
            // }
            //TODO: Fill itemsInLevel with 20 words from database 
            //TODO: 1 log/3 trash
            //TODO: Speed faster
            break;
        case 2:
            //TODO: Fill itemsInLevel with 40 words from database
            //TODO: 1 log/7 trash
            //TODO: Speed faster
            break; 
        case 3:
            //TODO: Fill itemsInLevel with 60 words from database
            //TODO 1 log/11 trash
            //TODO: Speed faster
            break;
        default:
            break;
    }
}

//60fps - called in draw() method 

//60fps
// main entry point method for this screen
void setupLevelScreen(int difficulty) {
    background(255);
    if (wordCount == 30) {
        mode = 5;
    }
    levelScreenFont = createFont("joystix monospace.ttf", 20);
    textFont(levelScreenFont, 20);
    obtainWords(difficulty);
    initializeLevelScreen(difficulty);
    // updateItemsOnScreen();
    moveItems();
    checkCollisions();
    displayTextTrash();
    displayText();
    checkIfMatch();
}

//60fps
void initializeLevelScreen(int difficulty) {
    //Set background image value
    gs.lives = 3;
    // gs.difficulty = difficulty;
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
    for (Item item : itemsOnScreen) {
        if (item.yCoord >= gs.damHeight) {
            gs.lives--;
            break;
        }
    }
    if (indexToBeRemoved != -1) {
        itemsOnScreen.remove(indexToBeRemoved);
        typing="";
    }

}

void displayTextTrash() {
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        Item item = itemsOnScreen.get(i);
        text(item.word, item.xCoord, item.yCoord);
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
        //gameOverScreen();
    }
}

// void keyPressed(){
//     typing += key;
// }




