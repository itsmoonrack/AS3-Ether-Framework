package fr.wedesign.components.textClasses
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import org.hamcrest.Matcher;
	
	/**
	 * Text that is curved following a circle path.
	 */
	public class CurveText extends Sprite
	{
		private var mSpacing:Number = 0;
		private var mContainer:Sprite = new Sprite();
		
		private const rad2deg:Number = 180 / Math.PI;
		
		/**
		 * Creates a new <code>CurveText</code>
		 * @param text The text string to set. Can't be empty.
		 * @param format The TextFormat object to apply.
		 * @param radius The distance from center. Must be > 0.
		 */
		public function CurveText(text:String, format:TextFormat, radius:Number)
		{
			var textField:TextField = new TextField();
			textField.text = text;
			textField.setTextFormat(format);
			var textWidth:Number = textField.textWidth;
			
			var angle:Number = textWidth / radius;
			var anglePer:Number = angle / text.length;
			
			for (var i:uint = 0; i < text.length; i++) {
				var char:TextField = new TextField();
				char.selectable = false;
				char.embedFonts = true;
				char.autoSize = TextFieldAutoSize.CENTER;
				char.text = text.charAt(i);
				char.setTextFormat(format);
				char.x = -char.textWidth / 2; // center the textfield.
				
				var sprite:Sprite = new Sprite();
				sprite.addChild(char);
				sprite.x = radius * Math.cos(anglePer * i);
				sprite.y = radius * Math.sin(anglePer * i);
				sprite.rotation = rad2deg * anglePer * i + 90; // orientate letters horizontally.
				
				addChild(sprite);
			}
		}
	}
}