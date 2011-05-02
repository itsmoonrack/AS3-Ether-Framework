/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.ScrollBar
 * @date:		Nov 12, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.ui.interactive.UIBarV;
	import com.wearevi.ui.interactive.UIButton;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	
	public class ScrollBar extends UIBarV 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "styles/FEI.as";
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		// replace by upArrow, downArrow
		public var upButton:UIButton;
		public var downButton:UIButton;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function ScrollBar()
		{
			// Constructeur generique pour le slider
			dragger = new Sprite();
			dragger.mouseEnabled = false;
			addChild(dragger);
			
			thumb.mouseEnabled = false;
			
			bounds = new Rectangle(0, 0, 0, track.height - thumb.height);
			
			liveDragging = true;
			
			upButton.autoRepeat = true;
			downButton.autoRepeat = true;
			
			upButton.addEventListener(UIButton.BUTTON_DOWN, scrollPressHandler, false, 0, true);
			downButton.addEventListener(UIButton.BUTTON_DOWN, scrollPressHandler, false, 0, true);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		protected function scrollPressHandler(event:Event) : void {
			event.stopImmediatePropagation();
			if (event.currentTarget == upButton) {
//				setScrollPosition ---- INVERTED
				// Use bounds instead !!!
				if (value >= thumb.height) value -= thumb.height;
				else value = 0;
			}
			else if (event.currentTarget == downButton) {
				if (value + thumb.height < bounds.height) value += thumb.height;
				else value = bounds.height;
			}
		}
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		override public function setValue(val:Number) : void {
			value = - val * (track.height + thumb.height);
		}
		override public function getValue() : Number {
			return - value / (track.height - thumb.height);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		override protected function set value(val:Number) : void {
			Tweener.addTween(thumb, {y:val, time:FOLLOWING_TIME});
			
			super.value = val;
		}
		override protected function get value() : Number {
			return super.value;
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}