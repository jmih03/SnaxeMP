import gameElements.Snake;
import gameElements.SnakeHandeler;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;

class KeyHandeler{
    var numberOfPlayers:Int;
    public function new() {
    }

    public function onKeyDown(event:KeyboardEvent):Void {
        switch event.charCode{
            case 119:
                w();
            case 97:
                a();
            case 115:
                s();
            case 100:
                d();
            default:
                trace("Unexpected key hit: " + event.charCode);
        }
    }

    private function w() {
        trace("w");
        SnakeHandeler.player1up();
    }
    private function a() {
        trace("a");
        SnakeHandeler.player1left();
    }
    private function s() {
        trace("s");
        SnakeHandeler.player1down();
    }
    private function d() {
        trace("d");
        SnakeHandeler.player1right();
    }
}