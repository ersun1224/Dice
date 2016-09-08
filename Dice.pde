Die bob;
int diceTotal = 0;
int clickCount = 0;

void setup()
{
	size(750,500);
	noLoop();
	textAlign(CENTER);
}
void draw()
{
	background(0);
	for(int i = 40; i < 426; i = i + 75) {
		for(int j = 50; j < 440; j = j + 75) {
		bob = new Die(i,j);
		diceTotal = diceTotal + bob.face;
		}
	}
	fill(255);
	text("Grand Total: " + diceTotal,625,100);
	text("You've rerolled " + clickCount + " times.", 625, 200);
}

void mousePressed()
{
	redraw();
	clickCount = clickCount + 1;
}

class Die //models one single dice cube
{
	//variable declarations here
	int myX, myY, face;
	double diceRoll;
	Die(int x, int y)
	{
		myX = x;
		myY = y;
		roll();
		show();
	}
	 void roll()
	{
		diceRoll = Math.random();
		if (diceRoll < .167) {
			face = 1;
		} else if (diceRoll < .333) {
			face = 2;
		} else if (diceRoll < .500) {
			face = 3;
		} else if (diceRoll < .667) {
			face = 4;
		} else if (diceRoll < .833) {
			face = 5;
		} else {
			face = 6;
		}
	}
	void show()
	{
		noStroke();
		fill(0,255,0);
		rect(myX, myY, 50, 50);

		fill(0);
		if(face == 1) {
			ellipse(myX + 25, myY + 25, 10, 10);
		} else if (face == 2) {
			ellipse(myX + 10, myY + 10, 10, 10);
			ellipse(myX + 40, myY + 40, 10, 10);
		} else if (face == 3) {
			ellipse(myX + 10, myY + 10, 10, 10);
			ellipse(myX + 25, myY + 25, 10, 10);
			ellipse(myX + 40, myY + 40, 10, 10);
		} else if (face == 4) {
			ellipse(myX + 10, myY + 10, 10, 10);
			ellipse(myX + 40, myY + 10, 10, 10);
			ellipse(myX + 10, myY + 40, 10, 10);
			ellipse(myX + 40, myY + 40, 10, 10);
		} else if (face == 5) {
			ellipse(myX + 10, myY + 10, 10, 10);
			ellipse(myX + 40, myY + 10, 10, 10);
			ellipse(myX + 10, myY + 40, 10, 10);
			ellipse(myX + 40, myY + 40, 10, 10);
			ellipse(myX + 25, myY + 25, 10, 10);
		} else if (face == 6) {
			ellipse(myX + 10, myY + 10, 10, 10);
			ellipse(myX + 40, myY + 10, 10, 10);
			ellipse(myX + 10, myY + 25, 10, 10);
			ellipse(myX + 40, myY + 25, 10, 10);
			ellipse(myX + 10, myY + 40, 10, 10);
			ellipse(myX + 40, myY + 40, 10, 10);
		}
	}
}
