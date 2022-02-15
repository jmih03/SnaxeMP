package gameElements;

class Head {
    var dir:Dir = Dir.WAITING;
    var x:Int;
    var y:Int;
    var ID:Int;

    public function new(x:Int,y:Int, ID:Int) {
        this.x = x;
        this.y = y;
        this.ID = ID;
    }

    public function getDir():Dir {
        return dir;
    }

    public function setDir(dir:Dir):Void {
        this.dir = dir;
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
}