/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.SeekBar
 * @date:		Nov 8, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import caurina.transitions.Tweener;
	
	import com.greensock.TweenMax;
	import com.wearevi.ui.interactive.UIBar;
	import com.wearevi.ui.interactive.UIButton;
	
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	public class SeekBar extends UIBar 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "styles/FEI.as";
		public static const TWEEN_TIME:Number = .5;
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var min:Number;
		private var max:Number;
		private var positionTextMin:Number;
		private var positionTextMax:Number;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var track:UIButton;
		public var thumb:UIButton;
		
		public var seekbarMask:Sprite;
		public var loadedMask:Sprite;
		public var elapsedMC:TextSprite;
		public var loadedMC:Sprite;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function SeekBar()
		{
			// Constructeur generique pour le slider
			dragger = new Sprite();
			dragger.mouseEnabled = false;
			addChild(dragger);
			
			thumb.mouseEnabled = false;
			// d'ou le override set width(val:Number) dans UIComponent, avec les private var _width, car le skin n'est pas la valeur du composant
			bounds = new Rectangle(0,0, track.width, 0);
			
			elapsedMC.mouseEnabled = false;
			
			min = elapsedMC.x;
			positionTextMin = min + elapsedMC.width;
			positionTextMax = track.width - elapsedMC.x;
			max = positionTextMax - elapsedMC.width;
			
			liveDragging = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		/** Between 0 and 1, will be deprecated, using getter and setter instead since we use the track  */
		override public function setValue(val:Number) : void {
			value = val * track.width;
		}
		override public function getValue() : Number {
			return value / track.width;
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function set loaded(value:Number) : void {
			loadedMask.x = value * track.width;
			if (value >= 1) {
				Tweener.addTween(loadedMC, {alpha:0});
			}
		}
		
		override protected function set value(val:Number) : void {
			TweenMax.to(thumb, FOLLOWING_TIME, {x:val});
			TweenMax.to(seekbarMask, FOLLOWING_TIME, {x:val});
			super.value = val;
			
			positionElapsedTimeText();
		}
		override protected function get value() : Number {
			return super.value;
		}
		public function set elapsedTime(val:Number) : void {
			var s:int = val % 60;
			var m:int = val / 60;
			elapsedMC.text = (m>9?m:"0"+m) + ":" + (s>9?s:"0"+s);
		}

		//- HELPERS -----------------------------------------------------------------------------------------------
		private function positionElapsedTimeText() : void {
			var _x:Number;
			
			if (value > positionTextMin && value < positionTextMax) _x = value - elapsedMC.width;
			else if (value < positionTextMin) _x = min;
			else _x = max;
			
			TweenMax.to(elapsedMC, FOLLOWING_TIME, {x:_x});
		}
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}