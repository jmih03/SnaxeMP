package graphics.colorThemes;

class DarkTheme extends ColorTheme{
    public function new() {
        final background = 0x282828;
        final grid = 0x757575;
        final border = 0x000000;
        final heads = [0x427b58,0x8f3f71,0x9d1016,0xb57614];
        final tails = [0x689d6a,0xb16286,0xcc443d,0xd79921];
        final pickUps = tails;
        super(background,grid, border, heads, tails, pickUps);
    }
}