/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.supportClasses.TrackBase
 * @date:		21 avr. 2010
 */
package fr.wedesign.components.supportClasses
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import fr.wedesign.components.Button;
	import fr.wedesign.core.UIComponent;
	import fr.wedesign.events.TrackBaseEvent;
	
	[Event(name="thumbDrag", type="fr.wedesign.events.TrackBaseEvent")]
	[Event(name="thumbPress", type="fr.wedesign.events.TrackBaseEvent")]
	[Event(name="thumbRelease", type="fr.wedesign.events.TrackBaseEvent")]
	/**
	 *  The TrackBase class is a base class for components with a track
	 *  and one or more thumb buttons, such as Slider and ScrollBar. It
	 *  declares two required skin parts: <code>thumb</code> and
	 *  <code>track</code>. 
	 *  The TrackBase class also provides the code for
	 *  dragging the thumb button, which is shared by the Slider and ScrollBar classes.
	 */
	public class TrackBase extends Range
	{
		
		public var thumb        :ButtonBase;
		public var track        :ButtonBase;
		public var liveDragging :Boolean = true;
		
		private var position    :Point;
		
		public function TrackBase()
		{
			super();
			position = new Point();
			
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		}
		
		/**
		 *  Converts a track-relative x,y pixel location into a value between 
		 *  the minimum and maximum, inclusive.  
		 * 
		 *  <p>TrackBase subclasses must override this method and perform conversions
		 *  that take their own geometry into account.
		 * 
		 *  For example, a vertical slider might compute a value like this:
		 *  <pre>
		 *  return (y / track.height) * (maximum - minimum);
		 *  </pre>
		 *  </p>
		 * 
		 *  <p>By default, this method returns <code>minimum</code>.</p>
		 * 
		 *  @param p The x or y coordinate of the location relative to the track's origin.
		 *           Returned by the setValidPosition() method depending on its own implementation.
		 */
		protected function pointToValue(x:Number, y:Number):Number
		{
			return minimum;
		}
		
		/**
		 *   Set the position of the thumb, then return the valid position.
		 *   TrackBase subclasses must override this method and perform conversions
		 *   that take their own geometry into account.
		 */
		protected function pointToLinearPosition(p:Point):Point { return null; }
		
		/**
		 *  @private
		 *  Capture any mouse down event and listen for a mouse up event
		 */
		private function mouseDownHandler(event:MouseEvent):void
		{
			if (event.target == track) {
				position = pointToLinearPosition(new Point(event.localX, event.localY));
				_value = pointToValue(position.x, position.y);
				
				dispatchEvent(new Event(Event.CHANGE));
			}
			
			stage.addEventListener(MouseEvent.MOUSE_UP, stage_mouseUpSomewhereHandler, true);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMoveHandler, true);
			
			dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_PRESS));
		}
		
		protected function stage_mouseMoveHandler(event:MouseEvent):void 
		{
			position = pointToLinearPosition(track.globalToLocal(new Point(event.stageX, event.stageY)));
			_value = pointToValue(position.x, position.y);
			
			dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_DRAG));
			if (liveDragging)
				dispatchEvent(new Event(Event.CHANGE));
		}
		
		private function stage_mouseUpSomewhereHandler(event:Event):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, stage_mouseUpSomewhereHandler, true);
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, stage_mouseMoveHandler, true);
			
			dispatchEvent(new TrackBaseEvent(TrackBaseEvent.THUMB_RELEASE));
		}
	}
}