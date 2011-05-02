/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.MuteButton
 * @date:		Nov 8, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import com.wearevi.ui.interactive.UIToggleButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class MuteButton extends UIToggleButton 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var vol_100:Sprite;
		public var vol_50:Sprite;
		public var vol_0:Sprite;
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function MuteButton()
		{
			_states = [vol_100, vol_0];
			mouseChildren = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function setVolume(value:Number) : void {
			if (value == 0) setState(1);
			else setState(0);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		override protected function click(e:MouseEvent) : void {
			
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}