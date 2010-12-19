/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.core.UIComponent
 * @date:		21 avr. 2010
 */
package uiether.core
{
  import flash.display.Sprite;
  import flash.geom.Point;
  import flash.geom.Rectangle;
  
  [Event(name="buttonDown",type="uiether.events.ComponentEvent")]
  [Event(name="show",type="uiether.events.ComponentEvent")]
  [Event(name="hide",type="uiether.events.ComponentEvent")]
  public class UIComponent extends Sprite
  {
    public function UIComponent()
    {
      super();
    }
    
    public function move(p:Point, bounds:Rectangle = null):void
    {
      x = p.x;
      y = p.y;
    }
  }
}