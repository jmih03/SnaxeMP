package;

import clocks.GameClock;
import gameElements.SnakeHandeler;
import graphics.MainGraphicsContainer;

import openfl.display.*;
import openfl.text.*;

class Main extends Sprite
{
	public function new()
	{
		super();
		trace("SnaxeMP Main started");
		//set the different variables for the game here
		var gameSpeed:Float = 5.0; //set game speed here
		var numberOfPlayers:Int = 3; //set number of players here
		var numberOfBots:Int = 1; //set number of bots here
		trace("game speed: " + gameSpeed);
		trace("number of players: " + numberOfPlayers);
		trace("number of bots: " + numberOfBots);

		//setup of the GameClock
		var gc:GameClock = new GameClock(gameSpeed);

		//setup of the Snakes
		SnakeHandeler.createSnakes(numberOfPlayers, numberOfBots);

		//setup of the Window
		openfl.display.StageScaleMode.SHOW_ALL;
		stage.displayState = StageDisplayState.NORMAL;
		var g = new MainGraphicsContainer(stage.stageWidth, stage.stageHeight);
		stage.addChild(g);
	}
}
