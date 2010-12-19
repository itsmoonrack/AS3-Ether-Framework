/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.player.view.PlayerMediator | PlayerMediator.as
 * @date:		29 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.fei.player.view {
	
	import com.wearevi.fei.player.model.PlayerModel;
	import com.wearevi.fei.player.view.patterns.PlayerPane;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import flash.events.Event;
	import flash.net.NetStream;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;

	public class PlayerMediator extends Mediator implements IMediator {
//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const NAME : String = 'PlayerMediator';
		public static const CLOSE_PLAYER : String = NAME + 'Close';
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _player_proxy : PlayerModel;
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlayerMediator(viewComponent : Object = null) {
			super(NAME, viewComponent);
			pane.addEventListener(PlayerPane.ON_PLAY, onPlay);
			pane.addEventListener(PlayerPane.ON_PAUSE, onPause);
			pane.addEventListener(PlayerPane.ON_START_SEEK, onStartSeek);
			pane.addEventListener(PlayerPane.ON_STOP_SEEK, onSeek);
			pane.addEventListener(PlayerPane.ON_UNMUTE, onUnmute);
			pane.addEventListener(PlayerPane.ON_VOL_CHANGE, onVolChange);
			pane.addEventListener(PlayerPane.ON_MUTE, onMute);
			
		}		
		override public function onRegister() : void {
			// throw an exception if PlayerModel is not here
			_player_proxy = PlayerModel(facade.retrieveProxy(PlayerModel.NAME));
			pane.video.attachNetStream(_player_proxy.getData() as NetStream);
			pane.setVolume(_player_proxy.volume);
			
			pane.addEventListener(Event.ENTER_FRAME,elapsedTime);
			pane.addEventListener(Event.ENTER_FRAME, mediaLoaded);
		}
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
				
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
				
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		override public function listNotificationInterests() : Array {
			return [PlayerModel.READY, PlayerModel.PLAYING, PlayerModel.PAUSED, PlayerModel.STOPPED, 
					PlayerModel.SOUND_CHANGED, PlayerModel.BUFFERING, PlayerModel.BUFFER_FULL];
		}
		override public function handleNotification( note : INotification ) : void {
			// @TODO: Not the proxy to set states but the mediator has to do it..
			// Proxy only send 'end' notification or 'net problems' and mediator set or not pause state
			switch(note.getName()) {
				case PlayerModel.PLAYING:
					pane.setStatePlay();
					pane.setVisible(false);
					
					if (note.getBody()) 
						pane.controlBar.videoTitle.text = (note.getBody() as VideoVO).title;;
					
					pane.addEventListener(Event.ENTER_FRAME,elapsedTime);
					break;
				
				case PlayerModel.PAUSED:
					pane.setStatePause();
					pane.removeEventListener(Event.ENTER_FRAME,elapsedTime);
					break;
				
				case PlayerModel.STOPPED:
					pane.setStatePause();
					pane.setTimeLinePos(0);
					pane.disableBuffering();
					pane.removeEventListener(Event.ENTER_FRAME,elapsedTime);
					break;
				
				case PlayerModel.BUFFERING:
					pane.enableBuffering();
					break;
				
				case PlayerModel.BUFFER_FULL:
					pane.disableBuffering();
					break;
				
				case PlayerModel.SOUND_CHANGED:
					pane.setVolume(note.getBody() as Number);
					break;
			}
		}
		private function mediaLoaded(event : Event) : void {
			if(_player_proxy.media_loaded!=1) pane.setLoaded(_player_proxy.media_loaded);
		}
		private function elapsedTime(event : Event) : void {
			pane.setTimeLinePos(_player_proxy.elapsed_time);
			pane.setTimeLineText(_player_proxy.stream_ns.time);
		}
		private function onPlay(event : Event) : void {
			_player_proxy.play();
		}
		private function onPause(event : Event) : void {
			_player_proxy.pause();
		}
		private function onStartSeek(event : Event) : void {
			pane.removeEventListener(Event.ENTER_FRAME,elapsedTime);
		}
		private function onSeek(event : Event) : void {
			_player_proxy.seekTo(pane.getTimeLinePos());
			pane.addEventListener(Event.ENTER_FRAME,elapsedTime);
		}
		private function onUnmute(event : Event) : void {
			_player_proxy.setUnMute();
		}
		private function onMute(event : Event) : void {
			_player_proxy.setMute();
		}
		private function onVolChange(event : Event) : void {
			_player_proxy.setVol(pane.getVolume());
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		private function get pane() : PlayerPane {
			return viewComponent as PlayerPane;
		}
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------

	}
}
