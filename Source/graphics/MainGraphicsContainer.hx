package graphics;

import gameElements.Head;
import gameElements.Tail;
import gameElements.PickUp;
import gameElements.SnakeHandeler;
import openfl.display.*;
import sys.thread.Lock;

class MainGraphicsContainer extends Sprite{
	var xoff:Int;
	var yoff:Int;
	var stageWidth:Int;
	var stageHeight:Int;
	public function new(stageWidth:Int, stageHeight:Int){
		super();
		trace("MainGraphicsContainer started loading...");

		xoff = Std.int((stageWidth-512)/2);
	    yoff = 20;
		this.stageWidth = stageWidth;
		this.stageHeight = stageHeight;

		paint();
	}

	public function paint() {
		graphics.clear();
		//drawing of the scene

		//draw Background
		graphics.beginFill(0x000000);
		graphics.drawRect(0,0,stageWidth,stageHeight);

		//draw Grid
		graphics.lineStyle(2, 0xffffff);
		graphics.beginFill(0x000000);
		for (i in 0...16){
			for (j in 0...16){
				graphics.drawRect(i*32 + xoff, j*32 + yoff, 32, 32);
			}
		}

		//draw Border
		graphics.beginFill(0,0);
		graphics.lineStyle(3, 0xff0000);
		graphics.drawRect(xoff,yoff,512,512);

		//draw Spawnrooms
		for (snake in SnakeHandeler.snakesInGame){
			graphics.beginFill(0xeeeeee,1);
			graphics.lineStyle(0,0,0);
			graphics.drawRect(xoff + snake.room.xCoordinates[0] * 32, yoff + snake.room.yCoordinates[0] * 32 , 96, 96);
		} 

		//draw PickUps
		for (snake in SnakeHandeler.snakesInGame) drawPickup(snake.pickup);
		
		//draw Tails
		for (snake in SnakeHandeler.snakesInGame) for (tail in snake.tails)  drawTail(tail);

		//draw Heads
		for (snake in SnakeHandeler.snakesInGame) drawHead(snake.head);

		//draw Border Spawnrooms
		for (snake in SnakeHandeler.snakesInGame){
			graphics.beginFill(0,0);
			graphics.lineStyle(3,0xaaaaaa,1);
			graphics.drawRect(xoff+snake.room.xCoordinates[0]*32, yoff + snake.room.yCoordinates[0]*32,96,96);
		}

		//draw Scores
		//TODO

		graphics.endFill();
	}

	public function repaint(lock:Lock) {
		paint();
		trace("lock 2 gets released");
		lock.release();
	}

	private function drawPickup(pickup:PickUp):Void {
		graphics.beginFill(0xddff99,1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((pickup.getX() * 32) + xoff, (pickup.getY() * 32) + yoff,32,32);
	}

	private function drawTail(tail:Tail):Void {
		graphics.beginFill(0xddaa99,1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((tail.getX() * 32) + xoff, (tail.getY() * 32) + yoff,32,32);
	}

	private function drawHead(head:Head):Void {
		graphics.beginFill(0xff0000,1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((head.getX() * 32) + xoff, (head.getY() * 32) + yoff,32,32);
	}
}