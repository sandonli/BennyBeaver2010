class Screens {

    //Should each screen have its own file?  

    String typing = ""; //word currently being typed

    Screens() {}

    //mouse.x & mouse.y
    void introScreen(){
        //TODO Draw an starting screen
        if (keyPressed) {
            if (key == 'ENTER'){
            mode = 2;
            }
        }
    }

    void mainMenu(){
        text("Main Menu", 850/2,850/2);
        // more text
    }

    void gameOver(){
        
    }
}
