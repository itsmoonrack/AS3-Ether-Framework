/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.ui.interactive.UIToggleButton | UIToggleButton.as
 * @date:		29 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.ui.interactive {

	import caurina.transitions.Tweener;

	public class UIToggleButton extends UIButton {
//- CONSTANTS ---------------------------------------------------------------------------------------------
		
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		protected var _states : Array;
		private var _current_state : Number = 0;
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function UIToggleButton() {
			super();
		}				
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
				
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		protected function setState($state : Number) : void {
			var lgt : Number = _states.length;
			while(lgt--) Tweener.addTween(_states[lgt], {alpha:(lgt == (_current_state = $state) ? 1 : 0), time:.5});
		}				
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get current_state() : Number {
			return _current_state;
		}
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
