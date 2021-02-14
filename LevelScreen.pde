PImage background; //TODO: Load the level screen background image

ArrayList<Item> itemsInLevel = new ArrayList();
ArrayList<Item> itemsOnScreen = new ArrayList();

//Initializes itemsInLevel
// void obtainWords() {
//     int difficulty = GameState.difficulty;
//     switch(difficulty) {
//         case 1:
//             //TODO: Fill itemsInLevel with 30 words from database
//             break;
//         case 2:
//             //TODO: Fill itemsInLevel with 45 words from database
//             break;
//         case 3:
//             //TODO: Fill itemsInLevel with 60 words from database
//             break;
//         default:
//             break;
//     }
// }

// void setupLevelScreen() {

// }

// //60fps
// void initializeLevelScreen(int difficulty) {
//     //Set background image value
//     GameState.lives = 3;
//     GameState.difficulty = difficulty;
// }

// // 60fps
// void updateItemsOnScreen() {
//     for (Item item : itemsInLevel) {
//         if (item.yCoord >= 0) {
//             itemsOnScreen.add(item);
//         }
//     }
// }

// //60fps
// void moveItems() {
//     for (Item item : itemsOnScreen) {
//         item.yCoord += item.ySpeed;
//     }
// }

// //60fps
// void checkCollisions() {
//     for (Item item : itemsOnScreen) {
//         if (item.yCoord >= GameState.damHeight) {
//             GameState.lives--;
//         }
//     }
// }

