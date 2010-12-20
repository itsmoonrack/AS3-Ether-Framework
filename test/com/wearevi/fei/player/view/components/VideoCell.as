/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.VideoCell
 * @date:		Nov 9, 2009
 */
package com.wearevi.fei.player.view.components 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.fei.player.vo.VideoVO;
	import com.wearevi.ui.interactive.PlaylistEvent;
	import com.wearevi.ui.interactive.UIButton;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class VideoCell extends UIButton 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _vo:VideoVO;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var titleCell:TextField;
		public var playVideoSprite:MovieClip;
		public var hover:Sprite;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function VideoCell(vo:VideoVO)	
		{
			_vo = vo;
			
			playVideoSprite.stop();
			mouseChildren = false;
			buttonMode = true;
			
			titleCell.text = vo.title;			
		}
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		override protected function click(e:MouseEvent) : void {
			dispatchEvent(new PlaylistEvent(PlaylistEvent.ITEM_CLICK, vo));
		}		
		override protected function over(event:MouseEvent) : void {
			playVideoSprite.play();
			Tweener.addTween(hover, {alpha:1, time:.5});
		}
		override protected function out(event:MouseEvent) : void {
			playVideoSprite.stop();
			Tweener.addTween(hover, {alpha:0, time:.5});
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get vo() : VideoVO {
			return _vo;
		}
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}