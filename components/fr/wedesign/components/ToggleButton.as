package fr.wedesign.components
{
  import flash.display.Sprite;
  
  import fr.wedesign.components.supportClasses.ButtonBase;

  public class ToggleButton extends ButtonBase
  {    
    protected var states:Vector.<Sprite> = new Vector.<Sprite>();
    protected var currentState:Number = 0;
  }
}