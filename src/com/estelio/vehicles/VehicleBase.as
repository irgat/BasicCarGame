package com.estelio.vehicles 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class VehicleBase extends MovieClip
	{
		
		public static const DIRECTION_LEFT:String = "DIRECTION_LEFT";
		public static const DIRECTION_RIGHT:String = "DIRECTION_RIGHT";
		public static const DIRECTION_STRAIGHT:String = "DIRECTION_STRAIGHT";
		
		private var _speed:Number;
		private var speedMax:Number;
		private var speedMaxReverse:Number;
		private var acceleration:Number;
		private var speedDecay:Number;
		
		protected var direction:Number;
		
		private var directionInterval:Number = .5;
		private var stopRange:Number = .5;
		
		public var leftKeyPressed:Boolean = false;
		public var rightKeyPressed:Boolean = false;
		public var upKeyPressed:Boolean = false;
		public var downKeyPressed:Boolean = false;
		
		/**
		 * @param	_speedInit
		 * @param	_speedMax
		 * @param	_speedMaxReverse
		 * @param	_acceleration
		 * @param	_speedDecay
		 * @param	_direction
		 */
		public function VehicleBase(_speedInit:Number, _speedMax:Number, _speedMaxReverse:Number, _acceleration:Number, _speedDecay:Number, _direction:Number)
		{
			_speed = _speedInit;
			speedMax = _speedMax;
			speedMaxReverse = _speedMaxReverse;
			acceleration = _acceleration;
			speedDecay = _speedDecay;
			direction = _direction;
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			init();
		}
		
		private function init():void 
		{
			trace("VehicleBase");
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			if (upKeyPressed) {
				_speed = Math.min(speed + acceleration, speedMax); //speed up until max speed
			}else if (downKeyPressed) {
				_speed = Math.max(speed - acceleration, speedMaxReverse); //speed up until max speed (reverse)
			}else { //speed down until stop
				if (Math.abs(speed) > stopRange) { 
					_speed *= speedDecay;
				}else {
					_speed = 0; //set speed value to 0 in this range to escape from infinite wiggle.
				}
			}
			
			if (speed != 0)
				movementAnimation();
			//trace("speed:", speed);
			
			checkCollision();
			
			if ((leftKeyPressed && rightKeyPressed) || (!leftKeyPressed && !rightKeyPressed)) { //set rotation value as straight either both (right, left) keys pressed or not
				steeringAnimation(DIRECTION_STRAIGHT);
			}else if (leftKeyPressed) {
				direction -= directionInterval * speed;
				steeringAnimation(DIRECTION_LEFT);
			}else if (rightKeyPressed) {
				direction += directionInterval * speed;
				steeringAnimation(DIRECTION_RIGHT);
			}
			rotation = direction;
		}
		
		private function checkCollision():void 
		{
			if (x < 0) {
				x = 0;
				_speed = 0;
			}else if (x > stage.stageWidth) {
				x = stage.stageWidth;
				_speed = 0;
			}
			
			if (y < 0) {
				y = 0;
				_speed = 0;
			}else if (y > stage.stageHeight) {
				y = stage.stageHeight;
				_speed = 0;
			}
		}
		
		/**
		 * @param	_direction
		 */
		protected function steeringAnimation(_direction:String):void 
		{
			
		}
		
		/**
		 * override if needed
		 */
		protected function movementAnimation():void
		{
			x += Math.sin(direction * Math.PI / 180) * speed;
			y += Math.cos(direction * Math.PI / 180) * -speed;
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function set speed(value:Number):void 
		{
			//_speed = value;
			throw new Error("Property is read-only."); //set speed as read-only property
		}
		
	}

}