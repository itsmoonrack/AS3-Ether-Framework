package fr.wedesign.media.core
{
	import flash.events.IEventDispatcher;

	public interface IVideoPlayer extends IEventDispatcher
	{
		/**
		 * Plays the currently cued/loaded video.
		 */
		function playVideo():void;
		
		/**
		 * Pauses the currently playing video.
		 */
		function pauseVideo():void;
		
		/**
		 * Stops and cancels loading of the current video.
		 */
		function stopVideo():void;
		
		/**
		 * Seeks to a specified time in the video.
		 * 
		 * @param seconds
		 * 		Identifies the time from which the video should start playing.
		 * @param allowSeekAhead
		 * 		Determines whether the player will make a new request to the
		 * 		server if the seconds parameter specifies a time outside of the
		 * 		currently buffered video data.
		 * 	
		 */
		function seekTo(seconds:Number, allowSeekAhead:Boolean):void;
		
		/**
		 * Mutes the player.
		 */
		function mute():void;
		
		/**
		 * Unmutes the player.
		 */
		function unMute():void;
		
		/**
		 * Returns true if the player is muted, false if not.
		 */
		function isMuted():Boolean;
		
		/**
		 * Sets the volume. Accepts an integer between 0 and 100.
		 */
		function setVolume(volume:Number):void;
		
		/**
		 * Returns the player's current volume, an integer between 0 and 100. 
		 */
		function getVolume():Number;
		
		/**
		 * Returns the number of bytes loaded for the current video.
		 */
		function getVideoBytesLoaded():Number;
		
		/**
		 * Returns the size in bytes of the currently loaded/playing video.
		 */
		function getVideoBytesTotal():Number;
		
		/**
		 * Returns the number of bytes the video file started loading from.
		 * Example scenario: the user seeks ahead to a point that hasn't loaded
		 * yet, and the player makes a new request to play a segment of the video
		 * that hasn't loaded yet.
		 */
		function getVideoStartBytes():Number;
		
		/**
		 * Returns the state of the player.
		 */
		function getPlayerState():Number;
		
		/**
		 * Returns the elapsed time in seconds since the video started playing.
		 */
		function getCurrentTime():Number;
		
		/**
		 * Returns the duration in seconds of the currently playing video. Note
		 * that getDuration() will return 0 until the video's metadata is loaded,
		 * which normally happens just after the video starts playing.
		 */
		function getDuration():Number;
	}
}