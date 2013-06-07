package  
{
	import org.flixel.*;
	public class Player extends FlxSprite
	{
		
		public function Player() 
		{
			makeGraphic(4, 4);
		}
		override public function update():void
		{
			super.update();
			if (FlxG.keys.UP) {
				y -= 1;
			}
			if (FlxG.keys.DOWN) {
				y += 1;
			}
			if (FlxG.keys.LEFT) {
				x -= 1;
			}
			if (FlxG.keys.RIGHT) {
				x += 1;
			}
		}
	}

}