/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.components.HSlider
 * @date:		25 avr. 2010
 */
package fr.wedesign.components
{
    import fr.wedesign.components.supportClasses.TrackBase;
    
    public class HSlider extends TrackBase
    {
        
        override protected function pointToValue(x:Number, y:Number):Number
        {
            var thumbRange:Number = track.width - thumb.width;
            return minimum + ((thumbRange != 0) ? (x / thumbRange) * range : 0);
        }
    }
}