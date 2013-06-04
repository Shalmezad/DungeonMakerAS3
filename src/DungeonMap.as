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
			var wall:FlxPoint = findRoomWall();
			map[wall.y * DUNGEON_WIDTH + wall.x] = 0;
		}
		
		private function digRect(rect:FlxRect):void
		{
			for (var x:int = rect.x; x < rect.x + rect.width; x++) {
				for (var y:int = rect.y; y < rect.y + rect.height; y++) {
					map[y*DUNGEON_WIDTH + x] = 0;
				}
			}
		}
		
		private function getSquare(x:int, y:int):uint
		{
			return map[y * DUNGEON_WIDTH + x];
		}
		
		private function findRoomWall():FlxPoint
		{
			var wall:FlxPoint = new FlxPoint( -1, -1);
			
			while(wall.x == -1){
				//pick a point.
				var x:int = randomIntBetween(1, DUNGEON_WIDTH - 2);
				var y:int = randomIntBetween(1, DUNGEON_HEIGHT - 2);
				if(getSquare(x,y) == 1){
					//is there a clear spot around it?
					if(getSquare(x+1,y) == 0 ||
					   getSquare(x-1,y) == 0 ||
					   getSquare(x,y+1) == 0 ||
					   getSquare(x,y-1)== 0)
					{
						wall.x = x;
						wall.y = y;
						return wall;
					}
				}
			}
			return wall;
		}
		
		//http://stackoverflow.com/questions/5450897/as3-how-can-i-generate-a-random-number
		private function randomIntBetween(min:int, max:int):int {
			return Math.round(Math.random() * (max - min) + min);
		}
		
	}

}