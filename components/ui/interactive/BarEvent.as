/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.ui.interactive.BarEvent
 * @date:		Nov 10, 2009
 */
package com.wearevi.ui.interactive 
{
	import flash.events.Event;

	public class BarEvent extends Event
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const CHANGE:String = "change";
		public static const THUMB_DRAG : String = 'thumbDrag';
		public static const THUMB_PRESS : String = 'thumbPress';
		public static const THUMB_RELEASE : String = 'thumbRelease';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _value:Number;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function BarEvent(type:String, value:Number)
		{
			_value = value;
			super(type);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get value() : Number {
			return _value;
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}