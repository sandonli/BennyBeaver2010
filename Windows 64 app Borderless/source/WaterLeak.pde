
// CALL WHEN COLLISION OCCURS ***
// IN IMAGES X AND Y VARIABLE FOR COLLISION COORDINATES
void waterLeak(){
    deltaTime3 = 2000;
    previousDisplayTime3 = 0;

    if (millis() > previousDisplayTime3 + deltaTime3) {
        frame3 = (frame3 + 1) % imageCount3;
        image(waterhole[frame3], 400, 800);
        previousDisplayTime3 = millis();
    }
}
