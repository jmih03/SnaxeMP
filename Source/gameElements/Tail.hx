package gameElements;

class Tail extends GameElement{
    var wait:Bool = true;

    public function new(x:Int,y:Int,color:Int) {
        super(x,y,color);
    }

    public function isWait():Bool {
        return wait;
    }

    public function setWait(wait:Bool):Void {
        this.wait = wait;
    }
}