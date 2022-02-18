package gameElements;

class Head extends GameElement{
    var dir:Dir = Dir.WAITING;
    var ID:Int;

    public function new(x:Int,y:Int,color:Int,ID:Int) {
        super(x,y,color);
        this.ID = ID;
    }

    public function getDir():Dir {
        return dir;
    }

    public function setDir(dir:Dir):Void {
        this.dir = dir;
    }
}