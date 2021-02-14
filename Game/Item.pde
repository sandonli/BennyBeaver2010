abstract class Item {
    protected String word; //word on the item
    
    protected boolean written = false; //whether the word has been written by the user yet or not
                             // false - render item on screen with word
                             // true - make item disappear

    //TODO: What are the horizontal px boundaries of the River?
    protected int xCoord = random(50, GameState.screenWidth) //horizontal pos of item
    protected int yCoord = 0; //vertical pos of item, initially 0 (top of screen)

    protected PImage image; //image associated with item

    Item(String word, PImage image) {
        this.word = word;
        this.image = image;
    }

    void writeWord() {
        written = true;
        //TODO: Create POOF animation sprite here for when item disappears
    }

    

}