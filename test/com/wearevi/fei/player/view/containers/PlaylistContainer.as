/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.containers.PlaylistContainer
 * @date:		Nov 11, 2009
 */
package com.wearevi.fei.player.view.containers 
{
	import caurina.transitions.Tweener;
	
	import com.wearevi.fei.player.view.components.OpenCloseButton;
	import com.wearevi.fei.player.view.patterns.PlaylistPane;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class PlaylistContainer extends Sprite 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		include "../components/styles/FEI.as";
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _open:Boolean;
		private var _enabled:Boolean;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		public var openCloseButton:OpenCloseButton;
		public var playlistPane:PlaylistPane;
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlaylistContainer() {
			openCloseButton.addEventListener(MouseEvent.CLICK, buttonEventHandler);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		public function buttonEventHandler(e:MouseEvent) : void {
			open = openCloseButton.isOpened();
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get enabled() : Boolean { return _enabled; }
		public function set enabled(value:Boolean) : void {
			_enabled = value;
			Tweener.addTween(this, {alpha:(value?1:0), time:(value?APPEAR_TIME:FADE_TIME)});
		}
		
		public function get open() : Boolean { return _open; }
		public function set open(value:Boolean) : void {
			Tweener.addTween(this, {x:(value ? 0 : -224), time:1});
			_open = value;
			if (_open) openCloseButton.setOpenedState();
			else openCloseButton.setClosedState();
		}
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}