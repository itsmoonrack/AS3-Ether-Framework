/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.BigPlayButton
 * @date:		Nov 8, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import caurina.transitions.Tweener;
	
	import com.greensock.TweenMax;
	import com.wearevi.ui.interactive.UIButton;
	
	import flash.events.MouseEvent;

	public class BigPlayButton extends UIButton
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "styles/FEI.as";
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------

		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
//		override protected function over(event:MouseEvent) : void {
//			TweenMax.to(this, OVER_TIME, {glowFilter:{color:GLOW_FILTER_COLOR, alpha:1, blurX:20, blurY:20}});
//		}
//		override protected function out(event:MouseEvent) : void {
//			TweenMax.to(this, OUT_TIME, {glowFilter:{color:GLOW_FILTER_COLOR, alpha:0, blurX:20, blurY:20}});
//		}
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		override public function set enabled(value:Boolean) : void {
			Tweener.addTween(this, {alpha:(value?1:0), time:(value?FADE_TIME:FADE_TIME)});
			mouseEnabled = value;
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}