package
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{	
		private var dm:DungeonMap;
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			dm = new DungeonMap();
			add(dm);
		}
	}
}