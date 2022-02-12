package gameElements;

class PickUp {
    var x:Int;
    var y:Int;

    public function new() {
        this.x = Random.int(0,15);
        this.y = Random.int(0,15);
    }

    public function reset():Void {
        this.x = Random.int(0,15);
        this.y = Random.int(0,15);
    }

    public function getX() {
        return x;
    }

    public function setX(x:Int):Void {
        this.x = x;
    }

    public function getY():Int {
        return y;
    }

    public function setY(y:Int):Void {
        this.y = y;
    }
}