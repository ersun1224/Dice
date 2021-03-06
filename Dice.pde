Die bob; 
int diceTotal = 0; //cumulative sum of dice
int clickCount = 1; //roll count

int total1, total2, total3, total4, total5, total6 = 0; //variables for row totals
int num1, num2, num3, num4, num5, num6 = 0; //variables for face totals



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
			diceTotal = diceTotal + bob.face; //adding to overall
			//row totals
			if(i == 40) {
				total1 = total1 + bob.face;
			} else if (i == 115) {
				total2 = total2 + bob.face;
			} else if (i == 190) {
				total3 = total3 + bob.face;
			} else if (i == 265) {
				total4 = total4 + bob.face;		
			} else if (i == 340) {
				total5 = total5 + bob.face;	
			} else if (i == 415) {
				total6 = total6 + bob.face;
			}
			//number of each face
			if(bob.face == 1) {
				num1++;
			} else if(bob.face == 2) {
				num2++;
			}
			else if(bob.face == 3) { 
				num3++;
			}
			else if(bob.face == 4) {
				num4++;
			}
			else if(bob.face == 5) {
				num5++;
			}
			else if(bob.face == 6) {
				num6++;
			}
		}
	}
	fill(255);
	text("Grand Total: " + diceTotal,625,100);
	text("You've rolled " + (clickCount) + " times.", 625, 150);
	text("Average Sum: " + (int)(diceTotal/clickCount), 625, 200);
	text("Row Total", 500, 25);

	text(total1,500,70); //row totals
	text(total2,500,145);
	text(total3,500,220);
	text(total4,500,295);
	text(total5,500,370);
	text(total6,500,445);

	text("1's: " + num1, 570, 250); //face totals
	text("2's: " + num2, 660, 250);
	text("3's: " + num3, 570, 290);
	text("4's: " + num4, 660, 290);
	text("5's: " + num5, 570, 330);
	text("6's: " + num6, 660, 330);
}


void mousePressed()
{
	
	clickCount = clickCount + 1;
	r = (int)(Math.random()*256);
	g = (int)(Math.random()*256);
	b = (int)(Math.random()*256);

	if(r+g+b < 300) { //color of dots depends on color of dice
		c = 255;
	} else {
		c = 0;
	}

	total1 = 0; //resets
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
