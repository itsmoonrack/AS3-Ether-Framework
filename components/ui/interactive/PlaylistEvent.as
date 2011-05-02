/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.ui.interactive.PlaylistEvent
 * @date:		Nov 10, 2009
 */
package com.wearevi.ui.interactive 
{
	import flash.events.Event;
	
	public class PlaylistEvent extends Event 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const ITEM_CLICK:String = 'itemClick';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _item:*;
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlaylistEvent(type:String, item:*)
		{
			_item = item;
			super(type, true);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get item() : * {
			return _item;
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}