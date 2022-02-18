package gameElements;

import graphics.MainGraphicsContainer;
import graphics.colorThemes.ColorTheme;
import openfl.text.TextField;

class SnakeHandeler {
	public static var playersInGame:Array<Snake> = new Array();
	public static var computersInGame:Array<Snake> = new Array();
	public static var snakesInGame:Array<Snake>;
	public static var spawnrooms:Array<SpawnRoom> = new Array();

	public static function createSnakes(numberOfPlayers:Int, numberOfBots:Int, colorTheme:ColorTheme){
		spawnrooms = createSpawnrooms(numberOfBots+numberOfPlayers);
		trace("SnakeHandeler started loading snakes...");
		for (i in 0...numberOfPlayers){
			var room:SpawnRoom = spawnrooms[i];
			var snake:Snake = new Snake(room.xCoordinates[1], room.yCoordinates[1], room, i,colorTheme);
			playersInGame.push(snake);
		}
		for (i in 0...numberOfBots){
			var room:SpawnRoom = spawnrooms[numberOfPlayers+i];
			computersInGame[i] = new Snake(room.xCoordinates[1], room.yCoordinates[1], room, numberOfPlayers + i,colorTheme);
		}
		snakesInGame = playersInGame.concat(computersInGame);
		makeSnakesOpponents(snakesInGame);
		trace(snakesInGame.length + " Snakes are created");
	}

	private static function createSpawnrooms(numberOfSnakes:Int):Array<SpawnRoom> {
		var spawnrooms:Array<SpawnRoom> = new Array();
		for (i in 0...numberOfSnakes){
			var x:Array<Int> = new Array();
			var y:Array<Int> = new Array();
			if (i%2 == 1){
				for (i in 0...3){
					var k:Int = i - 3;
					x.push(k);
				} 
			}
			else for (i in 16...19) x.push(i);
			if (i < 2){
				for (i in 3...6) y.push(i);
			}
			else for (i in 10...13) y.push(i);
			spawnrooms.push(new SpawnRoom(x,y));
		}
		return spawnrooms;
	}

	private static function makeSnakesOpponents(snakes:Array<Snake>) {
		for (snake in snakes){
			for (opponent in snakes){
				if (snake != opponent){
					snake.addOpponent(opponent);
				} 
			} 
		} 
	}

	public static function setUpScoreFields(g:MainGraphicsContainer) {
		for(snake in snakesInGame){
			var scoreField:TextField = new TextField();
			snake.scoreField = scoreField;
			scoreField.text = "score: " + snake.score;
			var bestscoreField:TextField = new TextField();
			snake.bestscoreField = bestscoreField;
			bestscoreField.text = "best: " + snake.bestscore;
			g.takeTextFieldsOfSnake(snake,scoreField,bestscoreField);
		}
	}

	public static function player1up() {
		playersInGame[0].setDirToUp();
	}
	public static function player1left() {
		playersInGame[0].setDirToLeft();
	}
	public static function player1down() {
		playersInGame[0].setDirToDown();
	}
	public static function player1right() {
		playersInGame[0].setDirToRight();
	}
	public static function player2up() {
		playersInGame[1].setDirToUp();
	}
	public static function player2left() {
		playersInGame[1].setDirToLeft();
	}
	public static function player2down() {
		playersInGame[1].setDirToDown();
	}
	public static function player2right() {
		playersInGame[1].setDirToRight();
	}
	public static function player3up() {
		playersInGame[2].setDirToUp();
	}
	public static function player3left() {
		playersInGame[2].setDirToLeft();
	}
	public static function player3down() {
		playersInGame[2].setDirToDown();
	}
	public static function player3right() {
		playersInGame[2].setDirToRight();
	}
}