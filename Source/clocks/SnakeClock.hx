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
        lock.release();
    }
    public function detectCollisions(lock:Lock) {
        if(Collision.collideSelf(snake)){
            snake.reset();
        }

        if (Collision.collideWall(snake)) {
            snake.reset();
        }

        for (opponent in opponents) {

            if (Collision.collideHeads(snake, opponent)) {
                snake.reset();
                opponent.reset();
            }

            if (Collision.collideOpponent(snake, opponent)){
                snake.reset();
            }
        }

        if (Collision.collidePickUp(snake)){
            snake.pickup.reset();
            snake.addTail();
            snake.score +=1;
            if(snake.score > snake.bestscore) snake.bestscore = snake.score;
        }

        lock.release();
    }
}