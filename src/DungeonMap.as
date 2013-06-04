package  
{
	import org.flixel.*;
	public class DungeonMap extends FlxTilemap
	{
		private static const DUNGEON_WIDTH:uint = 40;
		private static const DUNGEON_HEIGHT:uint = 30;
		
		private var map:Array;
		
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
			digRect(new FlxRect(10, 10, 5, 5));
		}
		
		private function digRect(rect:FlxRect):void
		{
			for (var x:int = rect.x; x < rect.x + rect.width; x++) {
				for (var y:int = rect.y; y < rect.y + rect.height; y++) {
					map[y*DUNGEON_WIDTH + x] = 0;
				}
			}
		}
		
		private function getSquare(p:FlxPoint):uint
		{
			return map[p.y * DUNGEON_WIDTH + p.x];
		}
	}

}