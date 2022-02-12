package gameElements;

class Tail {
    var x:Int;
    var y:Int;
    var wait:Bool = true;

    public function new(x:Int,y:Int) {
        this.x = x;
        this.y = y;
    }

    public function getX():Int {
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

    public function isWait():Bool {
        return wait;
    }

    public function setWait(wait:Bool):Void {
        this.wait = wait;
    }
}