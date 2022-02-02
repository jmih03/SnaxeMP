package;

import gui.Gui;
import clocks.GameClock;
import gameElements.SnakeHandeler;

import openfl.display.Sprite;

class Main extends Sprite
{
	public function new()
	{
		super();
		trace("SnaxeMP Main started");

		//setup of the GameClock
		var gameSpeed:Float = 5.0; //set game speed here
		trace("game speed: " + gameSpeed);
		var gc:GameClock = new GameClock(gameSpeed);

		//setup of the Snakes
		var numberOfPlayers:Int = 3; //set number of players here
		var numberOfBots:Int = 1; //set number of bots here
		trace("number of players: " + numberOfPlayers);
		trace("number of bots: " + numberOfBots);
		SnakeHandeler.createSnakes(numberOfPlayers, numberOfBots);

		//setup of the Window
		var g:Gui = new Gui();
	}
}
