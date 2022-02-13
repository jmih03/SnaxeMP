package gameElements;

class SnakeHandeler {
	public static var playersInGame:Array<Snake> = new Array();
	public static var computersInGame:Array<Snake> = new Array();
	public static var snakesInGame:Array<Snake>;
	public static var spawnrooms:Array<SpawnRoom> = new Array();

	public static function createSnakes(numberOfPlayers:Int, numberOfBots:Int){
		spawnrooms = createSpawnrooms(numberOfBots+numberOfPlayers);
		trace("SnakeHandeler started loading snakes...");
		for (i in 0...numberOfPlayers){
			var room:SpawnRoom = spawnrooms[i];
			var snake:Snake = new Snake(room.xCoordinates[1], room.yCoordinates[1], room, i);
			playersInGame.push(snake);
		}
		for (i in 0...numberOfBots){
			var room:SpawnRoom = spawnrooms[numberOfPlayers+i];
			computersInGame[i] = new Snake(room.xCoordinates[1], room.yCoordinates[1], room, numberOfPlayers + i);
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
}