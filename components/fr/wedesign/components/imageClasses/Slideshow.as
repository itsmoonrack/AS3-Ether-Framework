package fr.wedesign.components.imageClasses
{
  import flash.display.Bitmap;
  import flash.display.Loader;
  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.net.URLRequest;
  import flash.utils.Timer;
  
  import fr.wedesign.components.Image;
  import fr.wedesign.core.UIComponent;
  import fr.wedesign.events.ComponentEvent;
  
  [Event(name="show",type="fr.wedesign.events.ComponentEvent")]
  
  public final class Slideshow extends Sprite
  {
    private var images:Vector.<Bitmap> = new Vector.<Bitmap>();
    private var urls:Array; // Array<String>
    private var displayFunction:Function;
    private var loader:Loader = new Loader();
    private var timer:Timer = new Timer(10000);
    private var index:uint;
    
    public function Slideshow(displayFunction:Function, urls:Array)
    {
      this.displayFunction = displayFunction;
      this.urls = urls;
      this.timer.addEventListener(TimerEvent.TIMER, next);
      
      var request:URLRequest = new URLRequest(urls[0]);
      this.loader.load(request);
      this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, displayImage);
    }
    
    public function start():Slideshow
    {
      timer.start();
      return this;
    }
    
    public function stop():Slideshow
    {
      timer.stop();
      return this;
    }
    
    public function next(e:TimerEvent = null):void
    {
      index++;
      
      if (!e) {
        timer.stop();
      }
      // instanciate and load next image if exists.
      if (index >= images.length && index < urls.length) {
        var request:URLRequest = new URLRequest(urls[index]);
        loader.load(request);
      } else {
        displayImage();
      }
    }
    
    //Helper function for displaying an image via event or manually.
    private function displayImage(e:Event = null):void
    {
      if (e) {
        var bitmap:Bitmap = e.target.content as Bitmap;
        bitmap.smoothing = true;
        images.push(bitmap);
      }
      if (index >= images.length) {
        index = 0;
      }
      
      displayFunction.call(null, this, images[index]);
      dispatchEvent(new Event("show"));
    }
    
    public function set delay(value:Number):void
    {
      timer.delay = value;
    }
  }
}