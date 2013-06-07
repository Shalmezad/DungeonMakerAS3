package
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{	
		private var dm:DungeonMap;
		private var player:Player;
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			dm = new DungeonMap();
			add(dm);
			FlxG.watch(DungeonMap, "CORRIDORS_PER_ROOM", "Corridor ratio");
			FlxG.watch(DungeonMap, "FEATURE_TRIES", "Feature tries");
			player = new Player();
			var playerPos:FlxPoint = dm.findEmptySpot();
			player.x = playerPos.x * dm.width / dm.widthInTiles+1;
			player.y = playerPos.y * dm.height / dm.heightInTiles+1;
			add(player);
			
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = dm.width;
			FlxG.worldBounds.height = dm.height;
			FlxG.camera.setBounds(0, 0, dm.width, dm.height);
			FlxG.camera.follow(player);
			
			
		}
		
		private function resetDungeon():void
		{
			remove(dm);
			dm = new DungeonMap();
			add(dm);
			var playerPos:FlxPoint = dm.findEmptySpot();
			player.x = playerPos.x * dm.width / dm.widthInTiles+1;
			player.y = playerPos.y * dm.height / dm.heightInTiles+1;
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(dm, player);
			if (FlxG.keys.justPressed("SPACE")) {
				resetDungeon();
			}
			
			if (FlxG.keys.justPressed("Q")) {
				DungeonMap.CORRIDORS_PER_ROOM++;
				resetDungeon();
			}
			if (FlxG.keys.justPressed("A")) {
				if(DungeonMap.CORRIDORS_PER_ROOM>1){
					DungeonMap.CORRIDORS_PER_ROOM--;
				}
				resetDungeon();
			}
			
			if (FlxG.keys.justPressed("W")) {
				DungeonMap.FEATURE_TRIES++;
				resetDungeon();
			}
			if (FlxG.keys.justPressed("S")) {
				if(DungeonMap.FEATURE_TRIES>1){
					DungeonMap.FEATURE_TRIES--;
				}
				resetDungeon();
			}
			
		}
	}
}