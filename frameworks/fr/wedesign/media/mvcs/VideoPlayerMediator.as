package fr.wedesign.media.mvcs
{
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import fr.wedesign.media.common.ui.PlayPauseButton;
	import fr.wedesign.media.core.IVideoPlayer;
	import fr.wedesign.media.core.PlayerStateEvent;
	import fr.wedesign.media.video.ui.BasicControlBar;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class VideoPlayerMediator extends Mediator
	{
		private var controlBar:BasicControlBar;
		private var player:IVideoPlayer;
		
		private var playPauseButton:PlayPauseButton;
		
		[Inject]
		public function VideoPlayerMediator(controlBar:BasicControlBar, player:IVideoPlayer)
		{
			this.player = player;
			this.controlBar = controlBar;
		}
		
		override public function onRegister():void
		{
			playPauseButton = controlBar.playPauseButton as PlayPauseButton;
			playPauseButton.addEventListener(MouseEvent.CLICK, onPlayPause);
			
			player.addEventListener(PlayerStateEvent.PLAYING, playPauseButton.setPause);
			player.addEventListener(PlayerStateEvent.PAUSED, playPauseButton.setPlay);
		}
		
		private function onPlayPause(event:MouseEvent):void
		{
			if (controlBar.playPauseButton.isPlayState) {
				player.playVideo();
			} else {
				player.pauseVideo();
			}
		}
	}
}