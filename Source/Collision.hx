import gameElements.Snake;

class Collision {
    public static function collideSelf(snake:Snake):Bool {
        for(tail in snake.tails){
            if(snake.head.getX() == tail.getX() && snake.head.getY() == tail.getY() && !tail.isWait()){
                return true;
            }
        }
        return false;
    }

    public static function collideWall(snake:Snake):Bool {
        if (snake.isInSpawnroom()){
                    return false;
                }
        return (snake.head.getX() < 0 || snake.head.getX() > 15 || snake.head.getY() < 0 || snake.head.getY() > 15);
    }

    public static function collidePickUp(snake:Snake):Bool {
        if (snake.head.getX() == snake.pickup.getX() && snake.head.getY() == snake.pickup.getY()) {
            return true;
        }
        else {
            return false;
        }
    }

    public static function collideOpponent(snake:Snake, opponent:Snake):Bool{
        for(tail in opponent.tails){
            if (snake.head.getX() == tail.getX() && snake.head.getY() == tail.getY()){
                return true;
            }
        }
        if(snake.head.getX() == opponent.head.getX() && snake.head.getY() == opponent.head.getY()){
            return true;
        }
        return false;
    }

    public static function collideHeads(snake:Snake, opponent:Snake):Bool{
        if(snake.head.getX() == opponent.head.getX() && snake.head.getY() == opponent.head.getY()){
            return true;
        }
        else {
            return false;
        }
    }
}