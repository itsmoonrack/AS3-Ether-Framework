/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.OpenCloseButton
 * @date:		Nov 12, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import com.wearevi.ui.interactive.UIToggleButton;
	
	import flash.display.Sprite;
	
	public class OpenCloseButton extends UIToggleButton 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var closeButton:Sprite;
		public var openButton:Sprite;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function OpenCloseButton()
		{
			_states = [openButton, closeButton];
			mouseChildren = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function setOpenedState() : void {
			setState(1);
		}
		public function setClosedState() : void {
			setState(0);
		}
		public function isOpened() : Boolean {
			return (current_state == 0);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}