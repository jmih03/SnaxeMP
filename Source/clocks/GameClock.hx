package clocks;

import graphics.MainGraphicsContainer;
import haxe.macro.Expr.Catch;
import gameElements.Snake;
import gameElements.SnakeHandeler;
import sys.thread.*;

class GameClock{
	public var running:Bool = false;

	public var tilesPerSecond:Float;

	private var graphic:MainGraphicsContainer;

	public var lock:Lock = new Lock();

	public function new() {
		return;
	}

	public function initiate(gameSpeed:Float, graphic:MainGraphicsContainer):Void {
		trace("iniciating GameClock...");
		running = true;
		tilesPerSecond = gameSpeed;
		this.graphic = graphic;
		for (snake in SnakeHandeler.playersInGame) preparePlayerSnake(snake);
		for (snake in SnakeHandeler.computersInGame) prepareComputerSnake(snake);
		run();
	}

	private function run():Void {
		while(running){
			trace("Frame start");
			for (snake in SnakeHandeler.playersInGame){
				var thread:Thread = Thread.create(() -> snake.snakeClock.frame(this.lock));
			}
			this.lock.wait();
			var thread:Thread = Thread.create(() -> graphic.repaint(lock));
			this.lock.wait();
			Sys.sleep(1/tilesPerSecond);
			trace("Frame end");
		}
	}

	private function preparePlayerSnake(snake:Snake):Void {
		snake.newSnakeClock();
		snake.snakeClock.start();
	}
	private function prepareComputerSnake(snake:Snake):Void {
		//Snake.newCopmuterSnakeClock();
		//snake.ComputerClock.start();
		//snake.ComputerClock.join();
	}
}