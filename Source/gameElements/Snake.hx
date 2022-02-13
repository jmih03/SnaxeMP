package gameElements;

import clocks.SnakeClock;
import clocks.ComputerSnakeClock;

class Snake{
    private var spawnx:Int;
    private var spawny:Int;
    public var ID:Int;

    private var opponent:Array<Snake> = new Array();

    public var computerSnakeClock:ComputerSnakeClock;
    public var SnakeCLock:SnakeClock;

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
        this.opponent.push(opponent);
    }

    public function addTail() {
        
    }

    public function move() {
        
    }

    public function reset() {
        
    }

    public function ptc() {
        
    }

    public function newSnakeClock() {
        
    }

    public function isInSpawnroom() {
        
    }

    public function newComputerSnakeClock() {
        
    }
}