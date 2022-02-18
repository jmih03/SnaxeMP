package graphics.colorThemes;

class ColorTheme {
    public final background:Int;
    public final pickUps:Array<Int>;
    public final tails:Array<Int>;
    public final heads:Array<Int>;
    public final grid:Int;
    public final border:Int;
    public function new(background:Int, grid:Int, border:Int, heads:Array<Int>, tails:Array<Int>, pickUps:Array<Int>) {
        this.background = background;
        this.grid = grid;
        this.border = border;
        this.heads = heads;
        this.tails = tails;
        this.pickUps = pickUps;
    }
}