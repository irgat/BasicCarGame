package com.estelio 
{
	import com.estelio.vehicles.Formula1;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class Main extends MovieClip
	{
		private var formula1:Formula1;
		
		public function Main() 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			init();
		}
		
		private function init():void 
		{
			trace("Main");
			
			//create formula1 vehicle at the centre of stage
			//formula1 = new McLarenMercedes(); //-->> to create vehicles from the library
			formula1 = new Formula1();
			formula1.scaleX = formula1.scaleY = .25;
			formula1.x = stage.stageWidth / 2;
			formula1.y = stage.stageHeight / 2;
			addChild(formula1);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
		}
		
		private function keyDownHandler(e:KeyboardEvent):void 
		{
			//trace("keyPressed:",e.keyCode);
			switch (e.keyCode) 
			{
				case 37: //Left
					formula1.leftKeyPressed = true;
					break;
				case 38: //Up
					formula1.upKeyPressed = true;
					break;
				case 39: //Rightt
					formula1.rightKeyPressed = true;
					break;
				case 40: //Down
					formula1.downKeyPressed = true;
					break;
				default:
			}
		}
		
		private function keyUpHandler(e:KeyboardEvent):void 
		{
			//trace("keyReleased:",e.keyCode);
			switch (e.keyCode) 
			{
				case 37: //Left
					formula1.leftKeyPressed = false;
					break;
				case 38: //Up
					formula1.upKeyPressed = false;
					break;
				case 39: //Rightt
					formula1.rightKeyPressed = false;
					break;
				case 40: //Down
					formula1.downKeyPressed = false;
					break;
				default:
			}
		}
		
	}

}