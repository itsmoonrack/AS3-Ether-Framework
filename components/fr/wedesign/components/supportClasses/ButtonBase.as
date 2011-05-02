/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.supportClasses.ButtonBase
 * @date:		21 avr. 2010
 */
package fr.wedesign.components.supportClasses
{
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import fr.wedesign.core.UIComponent;
	import fr.wedesign.core.ui_internal;
	import fr.wedesign.events.ComponentEvent;
	
	use namespace ui_internal;
	
	public class ButtonBase extends UIComponent
	{
		ui_internal var rollOver		:Function;
		ui_internal var rollOut		:Function;
		ui_internal var mouseDown		:Function;
		
		public var autoRepeat		:Boolean;
		public var repeatInterval	:Number = 60;
		public var repeatDelay		:Number = 250;
		
		protected var pressTimer:Timer;
		
		public function ButtonBase()
		{
			super();
			mouseChildren = false;
			setupMouseEvents(mouseEventHandler);
			pressTimer = new Timer(1);
			pressTimer.addEventListener(TimerEvent.TIMER, buttonDown, false, 0, true);
		}
		
		protected function setupMouseEvents(mouseEventHandler:Function):void
		{
			addEventListener(MouseEvent.ROLL_OVER, mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.MOUSE_UP, mouseEventHandler, false, 0, true);
			addEventListener(MouseEvent.ROLL_OUT, mouseEventHandler, false, 0, true);
		}
		
		protected function startPress():void
		{
			if (autoRepeat)
			{
				pressTimer.delay = repeatDelay;
				pressTimer.start();
			}
			dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN, true));
		}
		
		protected function endPress():void
		{
			pressTimer.reset();
		}
		
		protected function mouseEventHandler(event:MouseEvent):void
		{
			if (event.type != MouseEvent.MOUSE_DOWN)
			{
				if (event.type == MouseEvent.ROLL_OVER || event.type == MouseEvent.MOUSE_UP)
				{
					if (rollOver != null) rollOver(event);
					endPress();
				}
				else if (event.type == MouseEvent.ROLL_OUT)
				{
					if (rollOut != null) rollOut(event);
					endPress();
				}
			}
			else 
			{
				if (mouseDown != null) mouseDown(event);
				startPress();
			}
		}
		
		protected function buttonDown(event:TimerEvent):void
		{
			if (autoRepeat) endPress();
			if (pressTimer.currentCount == 1) pressTimer.delay = repeatInterval;
			dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN, true));
		}
	}
}