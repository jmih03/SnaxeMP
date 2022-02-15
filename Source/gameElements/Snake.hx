package gameElements;

import clocks.SnakeClock;
import clocks.ComputerSnakeClock;

class Snake{
    private var spawnx:Int;
    private var spawny:Int;
    public var ID:Int;

    private var opponents:Array<Snake> = new Array();

    public var computerSnakeClock:ComputerSnakeClock;
    public var snakeClock:SnakeClock;

    public var room:SpawnRoom;

    public var score:Int = 0;
    public var bestscore:Int = 0;

    public var waitToMove:Bool = false;

    public var head:Head;

    public var tails:Array<Tail> = new Array();

    public var pickup:PickUp = new PickUp();

    public function new(spawnx:Int, spawny:Int, room:SpawnRoom, ID:Int) {
        this.spawnx = spawnx;
        this.spawny = spawny;
        this.room = room;
        this.head = new Head(spawnx,spawny,ID);
        this.ID = ID;
        trace("New Snake was created - ID: " + ID + " position: " + spawnx + "," + spawny);
    }

    public function addOpponent(opponent:Snake):Void {
        this.opponents.push(opponent);
    }

    public function addTail() {
        
    }

    public function move():Void {
        if(head.getDir() == Dir.WAITING){
            trace("Snake " + this.ID + " waited");
            return;
        }
        //move Tails
        if(tails.length >= 2){
            for (i in tails.length-1...1){
                if (tails[i].isWait()) {
                    tails[i].setWait(false);
                } else {
                    tails[i].setX(tails[i - 1].getX());
                    tails[i].setY(tails[i - 1].getY());
                }
            }
        }
        
        //move first Tail to Head
        if(tails.length >= 1){
            if(tails[0].isWait()){
                tails[0].setWait(false);
            }
            else {
                tails[0].setX(head.getX());
                tails[0].setY(head.getY());
            }
        }

        //move Head
        switch (head.getDir()) {
            case RIGHT:
                head.setX(head.getX() + 1);
                trace("Snake " + this.ID + " moved right");
            case UP:
                head.setY(head.getY() - 1);
                trace("Snake " + this.ID + " moved up");

            case LEFT:
                head.setX(head.getX() - 1);
                trace("Snake " + this.ID + " moved left");

            case DOWN:
                head.setY(head.getY() + 1);
                trace("Snake " + this.ID + " moved down");
            case WAITING:
                trace("This case should never be reached - check the code");
                return;
        }
    }

    public function reset() {
        
    }

    public function newSnakeClock() {
        snakeClock = new SnakeClock(this,opponents);
    }

    public function isInSpawnroom() {
        
    }

    public function newComputerSnakeClock() {
        return;
    }

    public function setDirToUp() {
        if(this.computerSnakeClock == null && this.snakeClock != null){
            if(this.head.getDir() != gameElements.Dir.DOWN){
                this.head.setDir(Dir.UP);
            }
        }
        trace("Snake " + this.ID + ":" + this.head.getDir());
    }
    public function setDirToLeft() {
        if(this.computerSnakeClock == null && this.snakeClock != null){
            if(this.head.getDir() != gameElements.Dir.RIGHT){
                this.head.setDir(Dir.LEFT);
            }
        }
        trace("Snake " + this.ID + ":" + this.head.getDir());
    }
    public function setDirToDown() {
        if(this.computerSnakeClock == null && this.snakeClock != null){
            if(this.head.getDir() != gameElements.Dir.UP){
                this.head.setDir(Dir.DOWN);
            }
        }
        trace("Snake " + this.ID + ":" + this.head.getDir());
    }
    public function setDirToRight() {
        if(this.computerSnakeClock == null && this.snakeClock != null){
            if(this.head.getDir() != gameElements.Dir.LEFT){
                this.head.setDir(Dir.RIGHT);
            }
        }
        trace("Snake " + this.ID + ":" + this.head.getDir());
    }
}