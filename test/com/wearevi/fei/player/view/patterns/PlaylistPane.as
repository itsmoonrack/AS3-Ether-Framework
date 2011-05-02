/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.components.PlaylistPane
 * @date:		Nov 9, 2009
 */
package com.wearevi.fei.player.view.patterns 
{
	import com.wearevi.fei.player.view.components.VideoCell;
	import com.wearevi.fei.player.vo.VideoVO;
	import com.wearevi.ui.interactive.BarEvent;
	import com.wearevi.ui.interactive.ScrollPane;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class PlaylistPane extends Sprite 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var playlistScrollPane:ScrollPane;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function addElement(vo:VideoVO) : void {
			playlistScrollPane.addElement(vo);
		}
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}