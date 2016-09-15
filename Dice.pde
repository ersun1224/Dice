Die bob;
int diceTotal = 0;
int clickCount = 1;

int total1, total2, total3, total4, total5, total6 = 0; //variables for row totals
int num1, num2, num3, num4, num5, num6 = 0;



int r = 0;	//to determine the color of the dice
int g = 255;
int b = 0;
int c = 0; //color of the dots

void setup()
{
	size(750,500);
	noLoop();
	textAlign(CENTER);
	textSize(15);
}
void draw()
{
	background(0);
	for(int i = 40; i < 426; i = i + 75) {
		for(int j = 50; j < 440; j = j + 75) {
			bob = new Die(j,i);
			diceTotal = diceTotal + bob.face;
			//row totals
			if(i == 40) {
				fill(0);
				rect(475, i, 50, 50);			
				fill(255);
				total1 = total1 + bob.face;
				text(total1,500,i+30);
			} else if (i == 115) {
				fill(0);
				rect(475, i, 50, 50);			
				fill(255);
				total2 = total2 + bob.face;
				text(total2,500,i+30);
			} else if (i == 190) {
				fill(0);
				rect(475, i, 50, 50);			
				fill(255);
				total3 = total3 + bob.face;
				text(total3,500,i+30);
			} else if (i == 265) {
				fill(0);
				rect(475, i, 50, 50);			
				fill(255);
				total4 = total4 + bob.face;
				text(total4,500,i+30);			
			} else if (i == 340) {
				fill(0);
				rect(475, i, 50, 50);		
				fill(255);
				total5 = total5 + bob.face;
				text(total5,500,i+30);	
			} else if (i == 415) {
				fill(0);
				rect(475, i, 50, 50);			
				fill(255);
				total6 = total6 + bob.face;
				text(total6,500,i+30);	
			}
			//number of each face
			if(bob.face == 1) {
				num1++;
				fill(0);
				rect(540, 230, 80, 30);
				fill(255);
				text("1's: " + num1, 570, 250);
			} else if(bob.face == 2) {
				num2++;
				fill(0);
				rect(630, 230, 80, 30);
				fill(255);
				text("2's: " + num2, 660, 250);
			}
			else if(bob.face == 3) { //continue here
				num3++;
				fill(0);
				rect(540, 260, 80, 30);
				fill(255);
				text("3's: " + num3, 570, 290);
			}
			else if(bob.face == 4) {
				num4++;
				fill(0);
				rect(630, 260, 80, 30);
				fill(255);
				text("4's: " + num4, 660, 290);
			}
			else if(bob.face == 5) {
				num5++;
				fill(0);
				rect(540, 310, 80, 30);
				fill(255);
				text("5's: " + num5, 570, 330);
			}
			else if(bob.face == 6) {
				num6++;
				fill(0);
				rect(630, 310, 80, 30);
				fill(255);
				text("6's: " + num6, 660, 330);
			}
		}
		//row totals
	}
	fill(255);
	text("Grand Total: " + diceTotal,625,100);
	text("You've rolled " + (clickCount) + " times.", 625, 150);
	text("Average Sum: " + (diceTotal/clickCount), 625, 200);
	text("Row Total", 500, 25);
}


void mousePressed()
{
	
	clickCount = clickCount + 1;
	r = (int)(Math.random()*256);
	g = (int)(Math.random()*256);
	b = (int)(Math.random()*256);

	if(r+g+b < 300) {
		c = 255;
	} else {
		c = 0;
	}

	total1 = 0;
	total2 = 0;
	total3 = 0;
	total4 = 0;
	total5 = 0;
	total6 = 0;

	num1 = 0;
	num2 = 0;
	num3 = 0;
	num4 = 0;
	num5 = 0;
	num6 = 0;
	redraw();
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
		fill(r,g,b);
		rect(myX, myY, 50, 50);

		fill(c);
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
