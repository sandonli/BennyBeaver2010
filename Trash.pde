class Trash extends Item {
    
    Trash(String word, PImage image) {
        super(word, image, width, height);
    }

    void hitDam() {
        if (yCoord >= GameState.damHeight) { //TODO: Replace 600 with dam image height
            GameState.lives--;
        }
    }
}