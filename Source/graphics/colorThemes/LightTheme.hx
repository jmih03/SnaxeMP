package graphics.colorThemes;

class LightTheme extends ColorTheme{
    public function new() {
        final background = 0xd3d3d3;
        final grid = 0x808080;
        final border = 0x000000;
        final heads = [0x009900,0x000099,0x990000,0x000000];
        final tails = [0x33cc33,0x3333cc,0xcc3333,0x333333];
        final pickUps = [0x66fb66,0x6666fb,0xfb6666,0x666666];
        super(background,grid, border, heads, tails, pickUps);
    }
}