/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.PlayPauseButton
 * @date:		Nov 8, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import com.greensock.TweenMax;
	import com.wearevi.ui.interactive.UIToggleButton;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class PlayPauseButton extends UIToggleButton 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "styles/FEI.as";
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var playAsset:Sprite;
		public var pauseAsset:Sprite;
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlayPauseButton() {
			_states = [pauseAsset, playAsset];
			mouseChildren = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function setStatePlay() : void {
			setState(0);
		}
		public function setStatePause() : void {
			setState(1);
		}
		public function isPlayState() : Boolean {
			return (current_state == 0);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
//		override protected function over(event:MouseEvent) : void {
//			var lgt:int = _states.length;
//			while(lgt--) TweenMax.to(_states[lgt], OVER_TIME, {tint:GLOW_FILTER_COLOR});
//		}
//		override protected function out(event:MouseEvent) : void {
//			var lgt:int = _states.length;
//			while(lgt--) TweenMax.to(_states[lgt], OVER_TIME, {removeTint:true});
//		}
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}