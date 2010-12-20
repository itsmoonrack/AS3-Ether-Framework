/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.SeekBarText
 * @date:		Nov 10, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class TextSprite extends Sprite 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var textField:TextField;
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function TextSprite() {
			mouseEnabled = false;
			mouseChildren = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function set text(value:String) : void {
			textField.text = value;
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}