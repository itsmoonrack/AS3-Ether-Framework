/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.Image
 * @date:		21 avr. 2010
 */
package uiether.components
{
  import flash.display.Bitmap;
  import flash.display.Loader;
  import flash.events.Event;
  import flash.net.URLRequest;
  
  import uiether.core.UIComponent;
  
  [Event(name="complete",type="flash.events.Event")]
  
  /**
   * The Image control lets you import JPEG, PNG, GIF, and SWF files 
   * at runtime.
   * You typically use the Image control for loading static graphic files and SWF files, 
   * and use the SWFLoader control for loading Flex applications. The Image control 
   * is also designed to be used in custom item renderers and item editors.
   */
  public class Image extends UIComponent
  {
    private var loader    :Loader = new Loader();
    private var _src	    :String;
    private var _width		:Number;
    private var _height		:Number;
    
    public function Image(src:String = null, width:Number = 0, height:Number = 0)
    {
      if (src) this.src = src;
      _width = width;
      _height = height;
      addChild(loader);
    }
    
    public function set src(value:String):void 
    {
      _src = value;
      
      if (stage) {
        load(); //Charge par défaut si l'image est sur la scène
      } else {
        addEventListener(Event.ADDED_TO_STAGE, load);
      }
    }
    
    public function load(e:Event = null):Image
    {
      if (e) removeEventListener(Event.ADDED_TO_STAGE, load);
      
      loader.load(new URLRequest(_src));
      loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
      
      return this;
    }
    
    //Fonction déclenchée lorsque l'image a été chargé par le lecteur Flash
    private function completeHandler(e:Event):void
    {
      _width = loader.contentLoaderInfo.width;
      _height = loader.contentLoaderInfo.height;
      Bitmap(loader.content).smoothing = true;
      loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeHandler);
      
      loader = null;
      dispatchEvent(new Event(Event.COMPLETE));
    }
    
    override public function get width():Number { return _width; }
    override public function set width(value:Number):void { loader.content.width = _width = value; }
    override public function get height():Number { return _height; }
    override public function set height(value:Number):void { loader.content.height = _width = value; }
    
  }
}