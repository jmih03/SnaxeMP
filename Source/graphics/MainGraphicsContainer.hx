package graphics;

import gameElements.Head;
import gameElements.Tail;
import gameElements.PickUp;
import gameElements.SnakeHandeler;
import gameElements.Snake;
import openfl.display.*;
import sys.thread.Lock;
import openfl.text.TextField;
import graphics.colorThemes.ColorTheme;

class MainGraphicsContainer extends Sprite{
	var xoff:Int;
	var yoff:Int;
	var stageWidth:Int;
	var stageHeight:Int;
	var colorTheme:ColorTheme;
	public function new(stageWidth:Int, stageHeight:Int,colorTheme:ColorTheme){
		super();
		trace("MainGraphicsContainer started loading...");

		xoff = Std.int((stageWidth-512)/2);
	    yoff = 20;
		this.stageWidth = stageWidth;
		this.stageHeight = stageHeight;
		this.colorTheme = colorTheme;

		paint();
	}

	public function paint() {
		graphics.clear();
		//drawing of the scene

		//draw Background
		graphics.beginFill(colorTheme.background);
		graphics.drawRect(0,0,stageWidth,stageHeight);

		//draw Grid
		graphics.lineStyle(2, colorTheme.grid);
		graphics.beginFill(colorTheme.background);
		for (i in 0...16){
			for (j in 0...16){
				graphics.drawRect(i*32 + xoff, j*32 + yoff, 32, 32);
			}
		}

		//draw Border
		graphics.beginFill(0,0);
		graphics.lineStyle(3, colorTheme.border);
		graphics.drawRect(xoff,yoff,512,512);

		//draw Spawnrooms
		for (snake in SnakeHandeler.snakesInGame){
			graphics.lineStyle(2, colorTheme.grid);
			graphics.beginFill(colorTheme.background);
			for (x in snake.room.xCoordinates){
				for (y in snake.room.yCoordinates){
					graphics.drawRect(x*32 + xoff, y*32 + yoff, 32, 32);
			}
		}
		} 

		//draw PickUps
		for (snake in SnakeHandeler.snakesInGame) drawPickup(snake.pickup);
		
		//draw Tails
		for (snake in SnakeHandeler.snakesInGame) for (tail in snake.tails)  drawTail(tail);

		//draw Heads
		for (snake in SnakeHandeler.snakesInGame) drawHead(snake.head);

		//draw Border Spawnrooms
		for (snake in SnakeHandeler.snakesInGame){
			graphics.beginFill(colorTheme.background,0);
			graphics.lineStyle(3,snake.head.getColor(),1);
			graphics.drawRect(xoff+snake.room.xCoordinates[0]*32, yoff + snake.room.yCoordinates[0]*32,96,96);
		}
		graphics.endFill();
	}

	public function repaint(lock:Lock) {
		paint();
		lock.release();
	}

	public function takeTextFieldsOfSnake(snake:Snake, scoreField:TextField, bestField:TextField) {
		scoreField.textColor = snake.head.getColor();
		scoreField.x = snake.room.xCoordinates[0]*32 + xoff;
		scoreField.y = (snake.room.yCoordinates[0]-2)*32 + yoff;
		this.addChild(scoreField);

		bestField.textColor = snake.head.getColor();
		bestField.x = snake.room.xCoordinates[0]*32 + xoff;
		bestField.y = (snake.room.yCoordinates[0]-1)*32 + yoff;
		this.addChild(bestField);
	}

	private function drawPickup(pickup:PickUp):Void {
		graphics.beginFill(pickup.getColor(),1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((pickup.getX() * 32) + xoff, (pickup.getY() * 32) + yoff,32,32);
	}

	private function drawTail(tail:Tail):Void {
		graphics.beginFill(tail.getColor(),1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((tail.getX() * 32) + xoff, (tail.getY() * 32) + yoff,32,32);
	}

	private function drawHead(head:Head):Void {
		graphics.beginFill(head.getColor(),1);
		graphics.lineStyle(0,0,0);
		graphics.drawRect((head.getX() * 32) + xoff, (head.getY() * 32) + yoff,32,32);
	}
}