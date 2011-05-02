/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.VolBar
 * @date:		Nov 11, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.ui.interactive.UIBarV;
	import com.wearevi.ui.interactive.UIButton;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	
	public class VolumeBar extends UIBarV
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "styles/FEI.as";
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var volumeBarMask:Sprite;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function VolumeBar()
		{
			// Constructeur generique pour le slider
			dragger = new Sprite();
			dragger.mouseEnabled = false;
			addChild(dragger);
			
			thumb.mouseEnabled = false;
			
			// INVERTED ! create a property
			bounds = new Rectangle(0, -track.height, 0, track.height);
			
			liveDragging = true;
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
			
			stage.addEventListener(Event.MOUSE_LEAVE, mouseLeaveHandler);
			
			thumb.visible = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		override public function setValue(val:Number) : void {
			value = - val * track.height;
		}
		override public function getValue() : Number {
			return - value / track.height;
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function mouseOverHandler(event:MouseEvent) : void {
			Mouse.hide();
			addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			thumb.visible = true;
		}
		private function mouseMoveHandler(event:MouseEvent): void {
			thumb.y = event.localY;
			event.updateAfterEvent();
			if (-event.localY > track.height) mouseOutHandler(event);
		}
		private function mouseOutHandler(event:MouseEvent):void {
			Mouse.show();
			removeEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
			thumb.visible = false;
		}
		private function mouseLeaveHandler(event:Event):void {
			mouseOutHandler(new MouseEvent(MouseEvent.MOUSE_MOVE));
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		override protected function set value(val:Number) : void {
			Tweener.addTween(volumeBarMask, {y:val, time:FOLLOWING_TIME});
			
			super.value = val;
		}
		override protected function get value() : Number {
			return super.value;
		}
		override public function set enabled(value:Boolean) : void {
			Tweener.addTween(this, {alpha:(value?1:0), time:(value?APPEAR_TIME:FADE_TIME)});
			mouseChildren = value;
			mouseEnabled = value;
		}
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}