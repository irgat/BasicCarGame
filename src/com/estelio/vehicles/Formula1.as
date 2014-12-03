package com.estelio.vehicles 
{
	/**
	 * ...
	 * @author Hasim Karaman
	 */
	public class Formula1 extends VehicleBase
	{
		/**
		 * @param	_speedInit
		 * @param	_speedMax
		 * @param	_speedMaxReverse
		 * @param	_acceleration
		 * @param	_speedDecay
		 * @param	_direction
		 */
		public function Formula1(_speedInit:Number = 0, _speedMax:Number = 10, _speedMaxReverse:Number = -10, _acceleration:Number = .25, _speedDecay:Number = .96 , _direction:Number = 0)
		{
			super(_speedInit, _speedMax, _speedMaxReverse, _acceleration, _speedDecay, _direction);
		}
		
		override protected function steeringAnimation(_direction:String):void 
		{
			super.steeringAnimation(_direction);
			
			if (_direction == DIRECTION_LEFT)
				gotoAndStop("left");
			else if (_direction == DIRECTION_RIGHT)
				gotoAndStop("right");
			else if (_direction == DIRECTION_STRAIGHT)
				gotoAndStop("straight");
		}
		
		override protected function movementAnimation():void 
		{
			super.movementAnimation();
		}
		
	}

}