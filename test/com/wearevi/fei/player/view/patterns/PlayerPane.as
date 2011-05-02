/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.PlayerPane
 * @date:		Nov 9, 2009
 */
package com.wearevi.fei.player.view.patterns 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.fei.player.view.components.BigPlayButton;
	import com.wearevi.fei.player.view.components.MuteButton;
	import com.wearevi.fei.player.view.components.PlayPauseButton;
	import com.wearevi.fei.player.view.components.SeekBar;
	import com.wearevi.fei.player.view.components.VolumeBar;
	import com.wearevi.fei.player.view.containers.PlaylistContainer;
	import com.wearevi.ui.interactive.BarEvent;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.media.Video;
	import flash.utils.Timer;
	
	public class PlayerPane extends Sprite 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const ON_PLAY : String = 'onPlay';
		public static const ON_PAUSE : String = 'onPause';
		public static const ON_MUTE : String = 'onMute';
		public static const ON_UNMUTE : String = 'onUnMute';
		public static const ON_VOL_CHANGE : String = 'onVolChange';
		public static const ON_START_SEEK : String = 'onStartSeek';
		public static const ON_SEEK : String = 'onSeek';
		public static const ON_STOP_SEEK : String = 'onStopSeek';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var timer:Timer = new Timer(2000);
		private var blackAndWhiteFilter:ColorMatrixFilter;
		
		// active property in the mediaController
		private var interacting:Boolean = false;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var video:Video;
		public var bigPlayButton:BigPlayButton;
		public var controlBar:ControlBar;
		public var bufferingMC:MovieClip;
		
		public var playlistContainer:PlaylistContainer;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlayerPane()
		{
			setupPlayerPaneEvents();
			setupFilter();
			
			// UIObject non interactive (create a class for generic MC)
			bufferingMC.mouseEnabled = false;
			
			timer.start();
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		private function setupFilter() : void {
			var rLum:Number = 0.2225;
			var gLum:Number = 0.7169;
			var bLum:Number = 0.0606; 
			
			var matrix:Array = [rLum, gLum, bLum, 0, 0, // red
				rLum, gLum, bLum, 0, 0,					// green
				rLum, gLum, bLum, 0, 0,					// blue
				0,    0,    0,    1, 0 ];				// alpha
			
			blackAndWhiteFilter = new ColorMatrixFilter(matrix);
		}
		private function setupPlayerPaneEvents() : void {
			addEventListener(MouseEvent.CLICK, playerPaneEventHandler);
			bigPlayButton.addEventListener(MouseEvent.CLICK, playerPaneEventHandler);
			addEventListener(MouseEvent.MOUSE_MOVE, playerPaneEventHandler);
			timer.addEventListener(TimerEvent.TIMER, playerPaneEventHandler);
			
			controlBar.playPauseButton.addEventListener(MouseEvent.CLICK, controlBarEventHandler);
			controlBar.addEventListener(MouseEvent.ROLL_OVER, overControlBar);
			controlBar.addEventListener(MouseEvent.ROLL_OUT, outControlBar);
			controlBar.seekBar.addEventListener(BarEvent.THUMB_PRESS, controlBarEventHandler);
			controlBar.seekBar.addEventListener(BarEvent.THUMB_RELEASE, controlBarEventHandler);
			controlBar.volumeBar.addEventListener(BarEvent.THUMB_PRESS, controlBarEventHandler);
			controlBar.volumeBar.addEventListener(BarEvent.THUMB_RELEASE, controlBarEventHandler);
			controlBar.muteButton.addEventListener(MouseEvent.CLICK, controlBarEventHandler);
		}
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function setStatePause() : void {
			bigPlayButton.enabled = true;
			(controlBar.playPauseButton as PlayPauseButton).setStatePause();
			video.filters = [blackAndWhiteFilter];
		}
		public function setStatePlay() : void {
			bigPlayButton.enabled = false;
			(controlBar.playPauseButton as PlayPauseButton).setStatePlay();
			video.filters = [];
		}
		public function getTimeLinePos() : Number {
			return controlBar.seekBar.getValue();
		}
		public function setTimeLinePos(val:Number) : void {
			controlBar.seekBar.setValue(val);
		}
		public function setTimeLineText(val:Number) : void {
			(controlBar.seekBar as SeekBar).elapsedTime = val;
		}
		public function setLoaded(val:Number) : void {
			(controlBar.seekBar as SeekBar).loaded = val;
		}
		public function disableBuffering() : void {
			Tweener.addTween(bufferingMC, {alpha:0});
		}
		public function enableBuffering() : void {
			Tweener.addTween(bufferingMC, {alpha:1});
			bufferingMC.play();
		}
		public function getVolume() : Number {
			return controlBar.volumeBar.getValue();
		}
		public function setVolume(value:Number) : void {
			(controlBar.muteButton as MuteButton).setVolume(value);
			(controlBar.volumeBar as VolumeBar).setValue(value);
		}
		public function setVisible(value:Boolean = true) : void {
			controlBar.enabled = value;
			if (playlistContainer) playlistContainer.enabled = value;
		}
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function playerPaneEventHandler(event:Event) : void {
			if (event.target == bigPlayButton && event.type == MouseEvent.CLICK) { dispatchEvent(new Event(ON_PLAY)); }
			else if (event.currentTarget == this) {
				if (event.type == MouseEvent.CLICK) dispatchEvent(new Event((controlBar.playPauseButton as PlayPauseButton).isPlayState() ? ON_PAUSE : ON_PLAY ));
				else {
					setVisible();
					timer.reset();
					// replace this with a "isFocused" property in UIComponents
					if (!interacting){
						timer.start();
					}
				}
			}
			else if (event.target == timer) {
				setVisible(false);
				timer.stop();
			}
			
			event.stopPropagation();
		}
		private function controlBarEventHandler(event:Event) : void {
			if (event.target == controlBar.playPauseButton) 
				dispatchEvent(new Event( (controlBar.playPauseButton as PlayPauseButton).isPlayState() ? ON_PAUSE : ON_PLAY ));
			
			else if (event.target == controlBar.seekBar) {
				
				if (event.type == BarEvent.THUMB_PRESS) { 
//					controlBar.seekBar.addEventListener(BarEvent.THUMB_DRAG, dispatchEvent); 
					dispatchEvent(new Event(ON_START_SEEK));
				}
				else if (event.type == BarEvent.THUMB_RELEASE) {
//					controlBar.seekBar.removeEventListener(BarEvent.THUMB_DRAG, dispatchEvent);
					dispatchEvent(new Event(ON_STOP_SEEK));
				}
			}
			
			else if (event.target == controlBar.volumeBar) {
				if (event.type == BarEvent.THUMB_PRESS) { 
					// use the liveDragging property !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					controlBar.volumeBar.addEventListener(BarEvent.THUMB_DRAG, dispatchSoundChangeEvent); 
					dispatchEvent(new Event(ON_VOL_CHANGE));
				}
				else if (event.type == BarEvent.THUMB_RELEASE) {
					controlBar.volumeBar.removeEventListener(BarEvent.THUMB_DRAG, dispatchSoundChangeEvent);
					dispatchEvent(new Event( controlBar.volumeBar.getValue() == 0 ? ON_MUTE : ON_VOL_CHANGE ));
				}
			}
			
			else if (event.target == controlBar.muteButton) {
				dispatchEvent(new Event( controlBar.muteButton.current_state == 0 ? ON_MUTE : ON_UNMUTE ));
			}
			
			event.stopPropagation();
		}
		private function overControlBar(e:Event) : void {
			interacting = true;
			timer.reset();
		}
		private function outControlBar(e:Event) : void {
			interacting = false;
			timer.start();
		}		
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		private function dispatchSoundChangeEvent(e:Event) : void {
			dispatchEvent(new Event(ON_VOL_CHANGE));
		}
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}