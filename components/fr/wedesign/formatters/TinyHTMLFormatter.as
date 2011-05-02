/**
 * @author:		Sylvain Lecoy / WeDesign (http://www.wedesign.fr/)
 * @class:		uiether.formatters.TinyHTMLFormatter
 * @date:		25 avr. 2010
 */
package fr.wedesign.formatters
{
    public class TinyHTMLFormatter
    {
        
        public static function replaceStrong(value:XML):XML
        {
            return value.replace("strong", "b");
        }
    }
}