/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.supportClasses.ButtonBase
 * @date:		21 avr. 2010
 */
package uiether.components.supportClasses
{
  import flash.events.MouseEvent;
  import flash.events.TimerEvent;
  import flash.utils.Timer;
  
  import uiether.core.UIComponent;
  import uiether.events.ComponentEvent;
  
  public class ButtonBase extends UIComponent
  {
    public var rollOver			:Function;
    public var rollOut			:Function;
    public var mouseDown		:Function;
    
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
    
    protected function mouseEventHandler(e:MouseEvent):void
    {
      if (e.type != MouseEvent.MOUSE_DOWN)
      {
        if (e.type == MouseEvent.ROLL_OVER || e.type == MouseEvent.MOUSE_UP)
        {
          if (rollOver != null) rollOver(e);
          endPress();
        }
        else if (e.type == MouseEvent.ROLL_OUT)
        {
          if (rollOut != null) rollOut(e);
          endPress();
        }
      }
      else 
      {
        if (mouseDown != null) mouseDown(e);
        startPress();
      }
    }
    
    protected function buttonDown(e:TimerEvent):void
    {
      if (autoRepeat) endPress();
      if (pressTimer.currentCount == 1) pressTimer.delay = repeatInterval;
      dispatchEvent(new ComponentEvent(ComponentEvent.BUTTON_DOWN, true));
    }
  }
}