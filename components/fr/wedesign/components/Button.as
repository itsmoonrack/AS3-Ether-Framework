/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.Button
 * @date:		21 avr. 2010
 */
package fr.wedesign.components
{
	import flash.events.MouseEvent;
	import fr.wedesign.components.supportClasses.ButtonBase;
	
	
	public class Button extends ButtonBase
	{
		public function Button()
		{
			super();
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, click, false, 0, true);
		}
		
		protected function click(event:MouseEvent):void {}
	}
}