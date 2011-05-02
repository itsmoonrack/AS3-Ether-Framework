/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.ui.interactive.ScrollPane
 * @date:		Nov 12, 2009
 */
package com.wearevi.ui.interactive 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.fei.player.view.components.VideoCell;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	public class ScrollPane extends Sprite
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private static var size:int = 0;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var pane:Sprite;
		public var mask_:Sprite;
		public var scrollBar:UIBarV;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function ScrollPane()
		{
			scrollBar.addEventListener(BarEvent.CHANGE, scroll);
			
			pane.mask = mask_;
			
			scrollBar.visible = false;
			scrollBar.enabled = false;
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function addElement(video:VideoVO) : DisplayObject {
			var cell:VideoCell = new VideoCell(video);
			// throw NO VIDEO CELL Exception !!!!!!!!!!!!!!!!!!!!
			if (!cell) throw new Error("No Cell defined: Cannot add to the ScrollPane.");
			var newY:Number = cell.height * size++;
			if (newY > mask_.height) {
				scrollBar.visible = true;
				scrollBar.enabled = true;
			}
			cell.y = newY;
			return pane.addChild(cell);
		}
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function scroll(e:BarEvent) : void {
			Tweener.addTween(pane, {y: - e.value * mask_.height, time: .5});
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}