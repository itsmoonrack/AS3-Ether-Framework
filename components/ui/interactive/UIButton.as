/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.ui.interactive.UIButton | UIButton.as
 * @date:		25 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.ui.interactive {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class UIButton extends UIObject {
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const BUTTON_DOWN:String = 'buttonDown';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		protected var pressTimer:Timer;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var hit_ : Sprite;
		public var autoRepeat:Boolean;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function UIButton() {
			addEventListener(MouseEvent.MOUSE_DOWN, down);
			addEventListener(MouseEvent.MOUSE_UP, up);
			addEventListener(MouseEvent.CLICK, click);
			buttonMode = true;
			
			pressTimer = new Timer(1);
			pressTimer.addEventListener(TimerEvent.TIMER, buttonDown, false, 0, true);
		}
				
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		protected function startPress() : void {
			if (autoRepeat) {
				pressTimer.delay = 250;
				pressTimer.start();
			}
			dispatchEvent(new Event(BUTTON_DOWN));
		}
		protected function endPress():void {
			pressTimer.reset();
		}
		
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		protected function buttonDown(event:TimerEvent) : void {
			if (!autoRepeat) { endPress(); return; }
			if (pressTimer.currentCount == 1) { pressTimer.delay = 60; }
			dispatchEvent(new Event(BUTTON_DOWN));
		}
		protected function down(e:MouseEvent) : void {
			startPress();
		}
		protected function up(e:MouseEvent) : void {
			endPress();
		}
		protected function click(e:MouseEvent) : void {}
		override protected function over(event:MouseEvent) : void {
			endPress();
		}
		override protected function out(event:MouseEvent) : void {
			endPress();
		}
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
