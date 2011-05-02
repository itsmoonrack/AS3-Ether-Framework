package fr.wedesign.media.common.ui
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import fr.wedesign.components.ToggleButton;
	
	public class PlayPauseButton extends ToggleButton
	{
		public var playButton:Sprite;
		public var pauseButton:Sprite;
		private var playState:Boolean;
		
		public function PlayPauseButton()
		{
			buttonMode = true;
			states.push(playButton, pauseButton);
			setPlay();
		}
		
		public function setPlay(event:Event = null):void
		{
			removeChild(pauseButton);
			addChild(playButton);
			playState = true;
		}
		
		public function setPause(event:Event = null):void
		{
			removeChild(playButton);
			addChild(pauseButton);
			playState = false;
		}
		
		public function get isPlayState():Boolean
		{
			return playState;
		}
		
	}
}