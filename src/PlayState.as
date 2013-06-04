package
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{	
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			add(new DungeonMap());
		}
	}
}