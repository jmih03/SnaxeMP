package gameElements;

class SpawnRoom {
    public var xCoordinates:Array<Int>;
    public var yCoordinates:Array<Int>;

    public function new(xCoordinates:Array<Int>, yCoordinates:Array<Int>) {
        this.xCoordinates = xCoordinates;
        this.yCoordinates = yCoordinates;
    }
}