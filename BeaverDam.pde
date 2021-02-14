/*
BeaverDam is the main class which contains the setup() method to start the game
 - Update file name when Game name is determined
*/

// mode 1: intro screen, mode 2: 

void setup() {
    size(GameState.screenWidth, GameState.screenHeight);
    mode = 1;
}

void draw() {
    switch(mode)
        case 1:
            // introBackground();
            break;
        case 2:
            // mainMenu();
            break;
        case 3:
            // levelBackground();
            break;
        case 4:
            // gameOverScreen();
            break;
        case 5:
            // levelPassed();
            break;
    
    }
    
}