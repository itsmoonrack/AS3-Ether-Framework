/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.ControlBar
 * @date:		Nov 9, 2009
 */
package com.wearevi.fei.player.view.patterns 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.fei.player.view.components.TextSprite;
	import com.wearevi.ui.interactive.UIBar;
	import com.wearevi.ui.interactive.UIBarV;
	import com.wearevi.ui.interactive.UIToggleButton;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ControlBar extends Sprite 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "../components/styles/FEI.as";
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var soundSelection:Boolean = false;
		private var autoFadeTimer:Timer = new Timer(2000);
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var seekBar:UIBar;
		public var volumeBar:UIBarV;
		public var videoTitle:TextSprite;
		public var playPauseButton:UIToggleButton;
		public var muteButton:UIToggleButton;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function ControlBar()
		{
			muteButton.addEventListener(MouseEvent.ROLL_OVER, overVolume);
			muteButton.addEventListener(MouseEvent.ROLL_OUT, outVolume);
			volumeBar.addEventListener(MouseEvent.ROLL_OVER, overVolume);
			volumeBar.addEventListener(MouseEvent.ROLL_OUT, outVolume);
			
			autoFadeTimer.addEventListener(TimerEvent.TIMER_COMPLETE, fadeVolume);
			autoFadeTimer.repeatCount = 1;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function overVolume(e:Event) : void {
			if (e.target == muteButton) volumeBar.enabled = true;
			soundSelection = (e.target == volumeBar);
		}
		private function outVolume(e:Event) : void {
			autoFadeTimer.reset();
			autoFadeTimer.start();
			soundSelection = false;
		}
		private function fadeVolume(e:Event) : void {
			volumeBar.enabled = soundSelection;
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function set enabled(value:Boolean) : void {
			Tweener.addTween(this, {alpha:(value?1:0), time:(value?APPEAR_TIME:FADE_TIME)});
		}
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}