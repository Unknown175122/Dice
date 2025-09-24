int totalNum;
int loopNum = 0;
int cheatCode = 0;
void setup()
{
  size(400,400);
  background(0,185,30);
  noLoop();
  for (int y = -10; y<400; y+=80){
    for (int x = -25; x<400; x+= 80) {
      fill(210,0,0);
      noStroke();
      rect(x,y,40,40);
      rect(x+40,y+40,40,40);
    }
  }
}
void draw()
{
  totalNum = 0;
  for (int y = 15; y<345; y+=60){
    for (int x = 20; x<350; x+= 60) {
      Die die = new Die(x,y);
      die.roll();
      die.show();
      totalNum += die.num;
    }}
  if (loopNum == 3 || loopNum%56 == 7 || cheatCode == 11) {
    reRoll();//rigged taste of freedom
  }
  cheatCode = 0; //the house always wins
  fill(240,211,35);
  noStroke();
  rect(125,370,150,25);
  stroke(0);
  fill(0);
  textSize(20);
  if (totalNum < 100){text(totalNum,190,393);}
  else if (totalNum < 1000){text(totalNum,185,393);}
  else {text(totalNum,180.12,393);}
    loopNum += 1;
  if (totalNum >=161) {
   System.out.println("Congrats"); 
   System.out.println(loopNum);
  }
}
void mousePressed()
{
  redraw();
}

void keyPressed()
{
  cheatCode +=1;
  System.out.println(cheatCode);
}
class Die //models one single dice cube
{
  int dieX, dieY;
  int num;
  
  Die(int x, int y) //constructor
  {
    dieX = x;
    dieY = y;
    num = (int)(Math.random()*6)+1;
  }
  void roll()
  {
    num = (int)(Math.random()*6)+1;
  }
  void show()
  {
    fill(255);
    stroke(175);
    rect(dieX,dieY,50,50,20);
    fill(0); //dots time
    stroke(0,0,20);
    if (num%2 == 1){ellipse(dieX+25,dieY+25,8,8);}//center if num is 1 3 or 5
    if (num >=2){
      ellipse(dieX+15,dieY+15,8,8); //topleft
      ellipse(dieX+35,dieY+35,8,8); //bottomright
    }
    if (num >=4){
      ellipse(dieX+35,dieY+15,8,8); //topright
      ellipse(dieX+15,dieY+35,8,8); //bottomleft
    }
    if (num == 6){
      ellipse(dieX+25,dieY+15,8,8); //topcenter
      ellipse(dieX+25,dieY+35,8,8); //bottomcenter
    }
    //ellipse(dieX+25,dieY+25,8,8); //center
    //ellipse(dieX+15,dieY+15,8,8); //topleft
    //ellipse(dieX+15,dieY+35,8,8); //bottomleft
    //ellipse(dieX+35,dieY+15,8,8); //topright
    //ellipse(dieX+35,dieY+35,8,8); //bottomright
    //ellipse(dieX+25,dieY+15,8,8); //topcenter
    //ellipse(dieX+25,dieY+35,8,8); //bottomcenter
  }
}

void reRoll() {
  totalNum = 0;
  for (int y = 15; y<345; y+=60){
    for (int x = 20; x<350; x+= 60) {
      Die die = new Die(x,y);
      while (die.num <5){
      die.roll();}
      if ((int)(Math.random() *6000)+1 == 1){die.num = 1;}
      if ((int)(Math.random() *543)+1 == 1){die.num = 2;}
      if ((int)(Math.random() *300)+1 == 1){die.num = 3;}
      if ((int)(Math.random() *60)+1 == 1){die.num = 4;}
      die.show();
      totalNum += die.num;
    }
  }
}
