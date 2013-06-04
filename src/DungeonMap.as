package  
{
	import org.flixel.*;
	public class DungeonMap extends FlxTilemap
	{
		private static const DUNGEON_WIDTH:uint = 40;
		private static const DUNGEON_HEIGHT:uint = 30;
		
		var map:Array;
		
		public function DungeonMap() 
		{
			initMap();	
			loadMap(FlxTilemap.arrayToCSV(map,DUNGEON_WIDTH), FlxTilemap.ImgAuto, 0, 0, FlxTilemap.AUTO);
		}
		
		private function initMap():void
		{
			map = new Array();
			for (var x:int = 0; x < DUNGEON_WIDTH; x++) {
				for (var y:int = 0; y < DUNGEON_HEIGHT; y++) {
					map.push(1);
				}
			}
			map[275] = 0;
		}
	}

}