int previousDisplayTime2;
int deltaTime2;


void introScreen(){
    deltaTime2 = 2000;
    previousDisplayTime2 = 0;

    if (millis() > previousDisplayTime2 + deltaTime2) {
        frame2 = (frame2 + 1) % imageCount2;
        image(intro[frame2], 0, 0);
        previousDisplayTime2 = millis();
    }


}
