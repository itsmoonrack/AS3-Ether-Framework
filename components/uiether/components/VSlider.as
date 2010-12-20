/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.VSlider
 * @date:		21 avr. 2010
 */
package uiether.components
{
    import uiether.components.supportClasses.TrackBase;
    
    public class VSlider extends TrackBase
    {
        
        override protected function pointToValue(x:Number, y:Number):Number
        {
            var thumbRange:Number = track.height - thumb.height;
            return minimum + ((thumbRange != 0) ? (y / thumbRange) * range : 0);
        }
        
    }
}