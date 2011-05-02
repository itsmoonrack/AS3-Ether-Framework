/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.ui.interactive.UIObject | UIObject.as
 * @date:		25 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.ui.interactive {
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class UIObject extends Sprite {
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		protected var _enabled:Boolean = true;
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		
		public function UIObject() {
			addEventListener(MouseEvent.ROLL_OVER, over);
			addEventListener(MouseEvent.ROLL_OUT, out);
		}				
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
				
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
				
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		protected function out(event : MouseEvent) : void {}
		protected function over(event : MouseEvent) : void {}		
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get enabled() : Boolean { return _enabled; }
		public function set enabled(value:Boolean) : void {
			_enabled = value;
			visible = value;
		}
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
