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
            case 0:
                switch event.keyCode{
                    case 38:
                        arrowUp();
                    case 37:
                        arrowLeft();
                    case 40:
                        arrowDown();
                    case 39:
                        arrowRight();
                }
            case 105:
                i();
            case 106:
                j();
            case 107:
                k();
            case 108:
                l();
            default:
                trace("Unexpected key hit: " + event.charCode + " - " + event.keyCode);
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
    private function arrowUp() {
        trace("arrowUp");
        SnakeHandeler.player2up();
    }
    private function arrowLeft() {
        trace("arrowLeft");
        SnakeHandeler.player2left();
    }
    private function arrowDown() {
        trace("arrowDown");
        SnakeHandeler.player2down();
    }
    private function arrowRight() {
        trace("arrowRight");
        SnakeHandeler.player2right();
    }
    private function i() {
        trace("i");
        SnakeHandeler.player3up();
    }
    private function j() {
        trace("j");
        SnakeHandeler.player3left();
    }
    private function k() {
        trace("k");
        SnakeHandeler.player3down();
    }
    private function l() {
        trace("l");
        SnakeHandeler.player3right();
    }
}