PImage background; //TODO: Load the level screen background image

ArrayList<Item> itemsInLevel = new ArrayList();
ArrayList<Item> itemsOnScreen = new ArrayList();
int logCount = 0; //# of logs the player has collected
boolean test = true;
PFont levelScreenFont;
String typing = "";
GameState gs = new GameState();

//Initializes itemsInLevel
void obtainWords(int difficulty) {
    switch(difficulty) {
        case 1:
            if (itemsOnScreen.size() < 30) {
                PImage p1 = loadImage("barrel_red.png");
                PImage p2 = loadImage("barrel_red.png");
                PImage p3 = loadImage("barrel_red.png");
                PImage p4 = loadImage("barrel_red.png");

                Item i1 = new Item("juice", p1);
                Item i2 = new Item("chess", p2);
                Item i3 = new Item("beaver", p3);
                Item i4 = new Item("churchill", p4);
                itemsOnScreen.add(i1);
                itemsOnScreen.add(i2);
                itemsOnScreen.add(i3);
                itemsOnScreen.add(i4);
            }
            //TODO: Fill itemsInLevel with 40 words from database 
            //TODO: 1 log/9 trash
            //TODO: Speed faster
            break;
        case 2:
            //TODO: Fill itemsInLevel with 60 words from database
            //TODO: 1 log/14 trash
            //TODO: Speed faster
            break; 
        case 3:
            //TODO: Fill itemsInLevel with 80 words from database
            //TODO 1 log/19 trash
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
    levelScreenFont = createFont("joystix monospace.ttf", 20);
    textFont(levelScreenFont, 20);
    obtainWords(difficulty);
    initializeLevelScreen(difficulty);
    updateItemsOnScreen();
    moveItems();
    checkCollisions();
    // displayTextTrash();
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
        if (item.yCoord >= 0 && itemsOnScreen.size() < 30) {
            itemsOnScreen.add(item);
        }
    }
}

//60fps
void moveItems() {
    for (Item item : itemsOnScreen) {
        item.yCoord += item.ySpeed;
        text(item.word, item.xCoord, item.yCoord);
    }
}

//60fps
void checkCollisions() {
    for (Item item : itemsOnScreen) {
        if (item.yCoord >= gs.damHeight) {
            gs.lives--;
        }
    }
}

void displayTextTrash() {
    for (int i = 0; i < itemsOnScreen.size(); i++) {
        text(itemsOnScreen.get(i).word, i * 100, i * 100);
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
        if (item.word.equals(typing)) {
            item.writeWord();
            indexToBeRemoved = i;
            break;
            // itemsOnScreen.remove(item);
        }
    }
    if (indexToBeRemoved != -1) {
        itemsOnScreen.remove(indexToBeRemoved);
        // typing = "";
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




