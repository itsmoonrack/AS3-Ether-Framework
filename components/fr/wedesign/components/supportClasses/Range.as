/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.supportClasses.Range
 * @date:		21 avr. 2010
 */
package fr.wedesign.components.supportClasses
{
	import flash.events.Event;
	
	import fr.wedesign.core.UIComponent;
	
	/**
	 *  Dispatched when the value of the control changes
	 *
	 *  @eventType flash.events.Event.CHANGE
	 */
	[Event(name="change", type="flash.events.Event")]
	
	/**
	 *  The Range class holds a value and an allowed range for that 
	 *  value, defined by <code>minimum</code> and <code>maximum</code> properties. 
	 *  The <code>value</code> property 
	 *  is always constrained to be between the current <code>minimum</code> and
	 *  <code>maximum</code>, and the <code>minimum</code>,
	 *  and <code>maximum</code> are always constrained
	 *  to be in the proper numerical order, such that
	 *  <code>(minimum &lt;= value &lt;= maximum)</code> is <code>true</code>. 
	 *  If the value of the <code>snapInterval</code> property is not 0, 
	 *  then the <code>value</code> property is also constrained to be a multiple of 
	 *  <code>snapInterval</code>.
	 * 
	 *  <p>Range is a base class for various controls that require range
	 *  functionality, including TrackBase and Spinner.</p>
	 */
	public class Range extends UIComponent
	{
		protected var range     :Number = 100;
		
		protected var _maximum  :Number = 100;
		protected var _minimum  :Number = 0;
		protected var _value    :Number = 0;
		
		public function Range()
		{
			
		}
		
		public function get value():Number { return _value; }
		public function set value(value:Number):void {
			if (value == _value)
				return;
			if (value > _maximum)
			{
				_value = _maximum;
			} else if (value < _minimum)
			{
				_value = _minimum;
			} else {
				_value = value;
			}
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function get maximum():Number 
		{
			return _maximum;
		}
		
		public function set maximum(max:Number):void
		{
			if (value == _maximum)
				return;
			else {
				var prevRange:Number = range;
				range = max - _minimum;
				_maximum = max;
				_value = (_value - _minimum) * (range / prevRange) + _minimum;
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		public function get minimum():Number
		{
			return _minimum;
		}
		
		public function set minimum(min:Number):void
		{
			if (value == _minimum)
				return;
			else {
				var prevRange:Number = range;
				range = _maximum - min;
				_minimum = min;
				_value = (_value - _maximum) * (range / prevRange) + _maximum;
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		
		
	}
}