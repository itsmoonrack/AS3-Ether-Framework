package fr.wedesign.media.video.player
{
	import flash.events.Event;
	
	import fr.wedesign.media.core.IVideoPlayer;
	import fr.wedesign.media.core.PlayerStateEvent;
	
	/**
	 * This event is fired when the player is loaded and initialized, meaning it
	 * is ready to receive API calls.
	 */
	[Event(name="onReady", type="flash.events.Event")]
	
	/**
	 * This event is fired whenever the player's state changes. Possible values
	 * are unstarted (-1), ended (0), playing (1), paused (2), buffering (3),
	 * video cued (5). When the SWF is first loaded it will broadcast an unstarted
	 * (-1) event. When the video is cued and ready to play it will broadcast a
	 * video cued event (5).
	 */
	[Event(name="onStateChange", type="flash.events.Event")]
	
	/**
	 * This event is fired whenever the video playback quality changes. For
	 * example, if you call the setPlaybackQuality(suggestedQuality) function,
	 * this event will fire if the playback quality actually changes. Your code
	 * should respond to the event and should not assume that the quality will
	 * automatically change when the setPlaybackQuality(suggestedQuality) function
	 * is called. Similarly, your code should not assume that playback quality
	 * will only change as a result of an explicit call to setPlaybackQuality or
	 * any other function that allows you to set a suggested playback quality.
	 * 
	 * The value that the event broadcasts is the new playback quality. Possible
	 * values are "small", "medium", "large", "hd720", "hd1080", and "highres".
	 */
	[Event(name="onPlaybackQualityChange", type="flash.events.Event")]
	
	/**
	 * This event is fired when an error in the player occurs. The possible error
	 * codes are 2, 100, 101, and 150:
	 * 
	 * The 2 error code is broadcast when a request contains an invalid parameter.
	 * For example, this error occurs if you specify a video ID that does not have
	 * 11 characters, or if the video ID contains invalid characters, such as
	 * exclamation points or asterisks.
	 * 
	 * The 100 error code is broadcast when the video requested is not found.
	 * This occurs when a video has been removed (for any reason), or it has
	 * been marked as private.
	 * 
	 * The 101 error code is broadcast when the video requested does not allow
	 * playback in the embedded players.
	 * 
	 * The error code 150 is the same as 101, it's just 101 in disguise!
	 */
	[Event(name="onError", type="flash.events.Event")]
	
	
	public class YouTubeChromelessPlayerAdapter implements IVideoPlayer
	{
		private static const WIDESCREEN_ASPECT_RATIO:String = "widescreen";
		
		private static const STATE_UNSTARTED:Number = -1;
		private static const STATE_ENDED:Number = 0;
		private static const STATE_PLAYING:Number = 1;
		private static const STATE_PAUSED:Number = 2;
		private static const STATE_CUED:Number = 5;
		
		private var adaptee:Object;
		
		public function YouTubeChromelessPlayerAdapter(player:Object)
		{
			adaptee = player;
			adaptee.addEventListener("onStateChange", onStateChange);
		}
		
		private function onStateChange(event:Event):void
		{
			switch (Object(event).data) {
				case STATE_UNSTARTED:
					dispatchEvent(new PlayerStateEvent(PlayerStateEvent.UNSTARTED));
					break;
				case STATE_ENDED:
					dispatchEvent(new PlayerStateEvent(PlayerStateEvent.ENDED));
					break;
				case STATE_PLAYING:
					dispatchEvent(new PlayerStateEvent(PlayerStateEvent.PLAYING));
					break;
				case STATE_PAUSED:
					dispatchEvent(new PlayerStateEvent(PlayerStateEvent.PAUSED));
					break;
				case STATE_CUED:
					dispatchEvent(new PlayerStateEvent(PlayerStateEvent.CUED));
					break;
			}
		}
		
		public function cueVideoById(videoId:String, startSeconds:Number, suggestedQuality:String):void
		{
			adaptee.cueVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		public function loadVideoById(videoId:String, startSeconds:Number = NaN, suggestedQuality:String = "default"):void
		{
			adaptee.loadVideoById(videoId, startSeconds, suggestedQuality);
		}
		
		public function cueVideoByUrl(mediaContentUrl:String, startSeconds:Number):void
		{
			adaptee.cueVideoByUrl(mediaContentUrl, startSeconds);
		}
		
		public function loadVideoByUrl(mediaContentUrl:String, startSeconds:Number):void
		{
			adaptee.loadVideoByUrl(mediaContentUrl, startSeconds);
		}
		
		public function playVideo():void
		{
			adaptee.playVideo();
		}
		
		public function pauseVideo():void
		{
			adaptee.pauseVideo();
		}
		
		public function stopVideo():void
		{
			adaptee.stopVideo();
		}
		
		public function seekTo(seconds:Number, allowSeekAhead:Boolean):void
		{
			adaptee.seekTo(seconds, allowSeekAhead);
		}
		
		public function mute():void
		{
			adaptee.mute();
		}
		
		public function unMute():void
		{
			adaptee.unMute();
		}
		
		public function isMuted():Boolean
		{
			return adaptee.isMuted();
		}
		
		public function setVolume(volume:Number):void
		{
			adaptee.setVolume(volume);
		}
		
		public function getVolume():Number
		{
			return adaptee.getVolume();
		}
		
		public function setSize(width:Number, height:Number):void
		{
			adaptee.setSize(width, height);
		}
		
		public function getVideoBytesLoaded():Number
		{
			return adaptee.getVideoBytesLoaded();
		}
		
		public function getVideoBytesTotal():Number
		{
			return adaptee.getVideoBytesTotal();
		}
		
		public function getVideoStartBytes():Number
		{
			return adaptee.getVideoStartBytes();
		}
		
		public function getPlayerState():Number
		{
			return adaptee.getPlayerState();
		}
		
		public function getCurrentTime():Number
		{
			return adaptee.getCurrentTime();
		}
		
		public function getPlaybackQuality():String
		{
			return adaptee.getPlaybackQuality();
		}
		
		public function setPlaybackQuality(suggestedQuality:String):void
		{
			adaptee.setPlaybackQuality(suggestedQuality);
		}
		
		public function getAvailableQualityLevels():Array
		{
			return adaptee.getAvailableQualityLevels();
		}
		
		public function getDuration():Number
		{
			return adaptee.getDuration();
		}
		
		public function getVideoEmbedCode():String
		{
			return adaptee.getVideoEmbedCode();
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			adaptee.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			adaptee.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return adaptee.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return adaptee.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return adaptee.willTrigger(type);
		}
		
		public function destroy():void
		{
			adaptee.destroy();
		}
	}
}
class QualityToPlayerWidth {
	public var small:Number = 320;
	public var medium:Number = 640;
	public var large:Number =  854;
	public var hd720:Number =  1280;
}