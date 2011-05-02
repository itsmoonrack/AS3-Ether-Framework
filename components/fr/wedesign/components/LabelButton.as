/**
 * @author:     Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:      uiether.components.LabelButton
 * @date:       15 janv. 2011
 */
package fr.wedesign.components
{
    import flash.events.MouseEvent;
    import flash.text.TextField;
    
    import fr.wedesign.components.supportClasses.ButtonBase;
    
    public class LabelButton extends ButtonBase
    {
        public var textField:TextField;
        
        public function LabelButton()
        {
            super();
            buttonMode = true;
            addEventListener(MouseEvent.CLICK, click, false, 0, true);
        }
        
        protected function click(e:MouseEvent):void {}
        
        public function set label(value:String):void
        {
            textField.text = value;
        }
        public function get label():String
        {
            return textField.text;
        }
    }
}