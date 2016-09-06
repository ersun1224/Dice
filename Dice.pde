void setup()
{
	size(500,500);
	noLoop();
	textAlign(CEMTER);
}
void draw()
{
	//your code here
}
void mousePressed()
{
	redraw();
}
class Dice //models one single dice cube
{
	//variable declarations here
	int myX, myY, face;
	Dice(int x, int y) //constructor
	{
		//variable initializations here
	}
	void roll()
	{
		double diceRoll = math.Random();
		if (diceRoll < .167) {
			face = 1;
		} else if (diceRoll < .333) {
			face = 2;
		} else if (diceRoll < .500) {
			face = 3;
		} else if (diceRoll < .667) {
			face = 4;
		} else if (diceRoll < ..833) {
			face = 5;
		} else {
			face = 6;
		}
	}
	void show()
	{
		//your code here
	}
}
