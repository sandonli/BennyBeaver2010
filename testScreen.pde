String typing = "";
    
void typeWord() {
    text("Word: " + typing, 425, 650);
}

void keyPressed(){
    typing += key;
}