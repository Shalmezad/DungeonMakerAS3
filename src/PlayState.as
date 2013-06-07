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
			FlxG.watch(DungeonMap, "CORRIDORS_PER_ROOM", "Corridor ratio");
			FlxG.watch(DungeonMap, "FEATURE_TRIES", "Feature tries");
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("SPACE")) {
				remove(dm);
				dm = new DungeonMap();
				add(dm);
			}
			
			if (FlxG.keys.justPressed("Q")) {
				remove(dm);
				DungeonMap.CORRIDORS_PER_ROOM++;
				dm = new DungeonMap();
				add(dm);
			}
			if (FlxG.keys.justPressed("A")) {
				remove(dm);
				if(DungeonMap.CORRIDORS_PER_ROOM>1){
					DungeonMap.CORRIDORS_PER_ROOM--;
				}
				dm = new DungeonMap();
				add(dm);
			}
			
			if (FlxG.keys.justPressed("W")) {
				remove(dm);
				DungeonMap.FEATURE_TRIES++;
				dm = new DungeonMap();
				add(dm);
			}
			if (FlxG.keys.justPressed("S")) {
				remove(dm);
				if(DungeonMap.FEATURE_TRIES>1){
					DungeonMap.FEATURE_TRIES--;
				}
				dm = new DungeonMap();
				add(dm);
			}
			
		}
	}
}