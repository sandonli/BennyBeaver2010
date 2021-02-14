class Item {
    String word; //word on the item
    
    boolean written = false; //whether the word has been written by the user yet or not
                             // false - render item on screen with word
                             // true - make item disappear
    int numWritten = 0;
    //the number of letters of the word written successfully

    //TODO: What are the horizontal px boundaries of the River?
    float xCoord = random(125, 450); //horizontal pos of item
    float yCoord = random(-500, 0); //vertical pos of item, initially 0 (top of screen)
    float ySpeed = 1.25; // speed of item falling

    int width; //width of item
    int height; //height of item

    PImage image; //image associated with item

    Item(String word, PImage image) {
        this.word = word;
        this.image = image;
        this.width = image.width;
        this.height = image.height;
    }
    
    void writeWord() {
        written = true;
        //TODO: Create POOF animation sprite here for when item disappears
    }

    //Setters and Getters

    
    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Item))
            return false;
        Item other = (Item)o;
        boolean word = (this.word == null && other.word == null)
        || (this.word != null && this.word.equals(other.word));
        return this.xCoord == other.xCoord && word;
    }

    @Override
    public final int hashCode() {
        int result = 17;
        if (word != null) {
            result = 31 * result + word.hashCode();
        }
        return result;
    }
}
