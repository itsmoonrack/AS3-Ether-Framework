/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.events.ComponentEvent
 * @date:		21 avr. 2010
 */
package uiether.events
{
	import flash.events.Event;
	
	public class ComponentEvent extends Event
	{
		public static const BUTTON_DOWN	:String = "buttonDown";
		public static const SHOW		:String = "show";
		public static const HIDE		:String = "hide";
		
		public function ComponentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}