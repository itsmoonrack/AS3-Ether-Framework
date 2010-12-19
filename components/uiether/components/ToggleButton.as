package uiether.components
{
  import flash.display.Sprite;
  import flash.events.MouseEvent;

  public class ToggleButton extends Button
  {
    public var toggleState:Function;
    
    protected var states:Vector.<Sprite> = new Vector.<Sprite>();
    protected var currentState:Number = 0;
    
    public function ToggleButton(...states:Array)
    {
      for each(var state:Sprite in states) {
        this.states.push(state);
      }
      addEventListener(MouseEvent.CLICK, toggleState, false, 0, true);
    }
    
    public function set state(n:Number):void {
      
    }
  }
}