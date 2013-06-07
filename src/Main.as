package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
 
	public class Main extends FlxGame
	{
		public function Main()
		{
			FlxG.debug = true;
			//super(320,240,PlayState,2);
			super(160,120,PlayState,4);
		}
	}
}