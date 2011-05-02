/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.events.TrackBaseEvent
 * @date:		24 avr. 2010
 */
package fr.wedesign.events
{
    import flash.events.Event;
    
    public class TrackBaseEvent extends Event
    {
        public static const THUMB_DRAG:String = "thumbDrag";
        public static const THUMB_PRESS:String = "thumbPress";
        public static const THUMB_RELEASE:String = "thumbRelease";
        
        public function TrackBaseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
        {
            super(type, bubbles, cancelable);
        }
        
        override public function clone():Event
        {
            return new TrackBaseEvent(type, bubbles, cancelable);
        }
    }
}