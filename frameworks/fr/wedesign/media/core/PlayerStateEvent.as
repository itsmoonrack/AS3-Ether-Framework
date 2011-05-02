package fr.wedesign.media.core
{
	import flash.events.Event;
	
	public class PlayerStateEvent extends Event
	{
		public static const UNSTARTED:String = "unstarted";
		public static const ENDED:String = "ended";
		public static const PLAYING:String = "playing";
		public static const PAUSED:String = "paused";
		public static const CUED:String = "cued";
		
		public function PlayerStateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}