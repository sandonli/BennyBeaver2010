# BennyBeaver2010

fun game

_Classes:_

wordsList
Logs
Trash
GameState (lives, level, etc.)

_Screens:_

Main Menu
Transition
Cutscenes?
Level Background
Level Selector?
Level Passed?
Endless
Game Over with SAD BEAVER

_Animations:_

Log/Trash disappearing POOF animation

_Ideas:_

Bomb word?

Instructions:

- Install joystix monospace.ttf

BeaverDam

- Main class to start the game
- Displays specified screen

GameState

- Maintains state of game (lives, difficulty, etc.)
- EVERYTIME the game changes to a new Screen make sure to update the GameState correctly

IntroScreen

- Show intro image
- Fade into Menu Screen

MenuScreen

- Contain play button that changes screen to LevelScreen

LevelScreen

- Have background image
- Have animations
- Contain Menu button that changes screen to Menu
- Show words + image going down screen
- Have text box for inputting words
- Contain logic for handling user input

GameOverScreen

- Show game over image
- Contain Menu button that changes screen to Menu

LevelPassedScreen

- Show level passed image
- Contain Menu button that changes screen to Menu
- Contain Next Level button that changes screen to LevelScreen
