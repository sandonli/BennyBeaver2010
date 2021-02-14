class Item {
    String word; //word on the item
    
    boolean written = false; //whether the word has been written by the user yet or not
                             // false - render item on screen with word
                             // true - make item disappear
    int numWritten = 0;
    //the number of letters of the word written successfully

    //TODO: What are the horizontal px boundaries of the River?
    float xCoord = random(50, GameState.screenWidth); //horizontal pos of item
    int yCoord = floor(random(0, -500)); //vertical pos of item, initially 0 (top of screen)
    float ySpeed = random(1, 2); // speed of item falling

    int width; //width of item
    int height; //height of item

    PImage image; //image associated with item

    Item(String word, PImage image) {
        this.word = word;
        this.image = image;
        this.width = image.width;
        this.height = image.height;
    }

    void itemFall(){
        yCoord += ySpeed;
    }

    void writeWord() {
        written = true;
        //TODO: Create POOF animation sprite here for when item disappears
    }

    //Setters and Getters





}