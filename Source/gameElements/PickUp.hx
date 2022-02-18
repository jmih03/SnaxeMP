package gameElements;

class PickUp extends GameElement{
    public function new(color:Int) {
        super(Random.int(0,15),Random.int(0,15),color);
    }

    public function reset():Void {
        this.x = Random.int(0,15);
        this.y = Random.int(0,15);
    }
}