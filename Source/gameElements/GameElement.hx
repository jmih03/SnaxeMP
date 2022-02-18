package gameElements;

class GameElement {
    var x:Int;
    var y:Int;
    var color:Int;

    public function new(x:Int,y:Int,color:Int) {
        this.x = x;
        this.y = y;
        this.color = color;
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

    public function getColor():Int {
        return color;
    }

    public function setColor(color:Int):Void {
        this.color = color;
    }
}