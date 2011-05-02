/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.ui.interactive.UIBar | UIBar.as
 * @date:		30 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.ui.interactive {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;

	public class UIBar extends UIButton {
//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const HORIZONTAL : String = 'horizontal';
		public static const VERTICAL : String = 'vertical';
		
//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _value : Number;
		private var _bounds : Rectangle;
		protected var liveDragging : Boolean = true;
		protected var dragger : Sprite;
		protected var direction : String;
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function UIBar() {
			super();
			addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		}				
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
				
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function getValue() : Number {
			return value;
		}
		public function setValue($val : Number) : void {
			value = $val;
		}				
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function onDown(event : MouseEvent) : void {
			dragger.x = event.localX;		
			dragger.startDrag(false, _bounds);
			stage.addEventListener(MouseEvent.MOUSE_UP, endDrag);
			addEventListener(Event.ENTER_FRAME, follow);
			dispatchEvent(new BarEvent(BarEvent.THUMB_PRESS, value));
		}
		private function endDrag(event : MouseEvent) : void {
			removeEventListener(Event.ENTER_FRAME, follow);
			stage.removeEventListener(MouseEvent.MOUSE_UP, endDrag);
			dragger.stopDrag();
			value = dragger.x;
			dispatchEvent(new BarEvent(BarEvent.THUMB_RELEASE, value));
		}
		private function follow(event : Event) : void {
			value = dragger.x;
			if (liveDragging) {
				dispatchEvent(new BarEvent(BarEvent.THUMB_DRAG, value));
			}
		}
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		protected function get value() : Number {
			return _value;
		}
		protected function set value($val : Number) : void {
			_value = $val;
		}
		protected function set bounds($rectangle : Rectangle) : void {
			_bounds = $rectangle;
		}
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
