/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.ui.interactive.ListEvent
 * @date:		Nov 10, 2009
 */
package com.wearevi.ui.interactive 
{
	import flash.events.Event;
	
	public class ListEvent extends Event 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const ITEM_CLICK:String = 'itemClick';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _columnIndex:int;
		private var _rowIndex:int;
		private var _index:int;
		private var _item:Object;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function ListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, columnIndex:int=-1, rowIndex:int=-1, index:int=-1, item:Object=null)
		{
			super(type, bubbles, cancelable);
			_rowIndex = rowIndex;
			_columnIndex = columnIndex;
			_index = index;
			_item = item;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get rowIndex():int { return _rowIndex; }
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}