package clocks;

import gameElements.Snake;
import sys.thread.Lock;

class SnakeClock {
    private var snake:Snake;
    private var opponents:Array<Snake>;

    public function new(snake:Snake, opponents:Array<Snake>) {
        this.snake = snake;
        this.opponents = opponents;
    }
    public function start() {
        trace("Snake " + snake.ID + " started clock");        
    }
    public function frame(lock:Lock) {
        snake.move();
        snake.waitToMove = false;
        trace("lock gets released");
        lock.release();
    }
}