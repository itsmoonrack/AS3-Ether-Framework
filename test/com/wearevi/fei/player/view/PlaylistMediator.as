/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.view.PlaylistMediator
 * @date:		Nov 10, 2009
 */
package com.wearevi.fei.player.view 
{
	import com.wearevi.fei.player.Playlist;
	import com.wearevi.fei.player.model.PlaylistModel;
	import com.wearevi.fei.player.view.patterns.PlaylistPane;
	import com.wearevi.fei.player.vo.VideoVO;
	import com.wearevi.ui.interactive.PlaylistEvent;
	
	import org.puremvc.as3.multicore.interfaces.IMediator;
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.mediator.Mediator;
	
	public class PlaylistMediator extends Mediator implements IMediator 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const NAME : String = 'PlaylistMediator';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlaylistMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			pane.addEventListener(PlaylistEvent.ITEM_CLICK, onItemClick);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		override public function listNotificationInterests() : Array {
			return [PlaylistModel.READY];
		}
		override public function handleNotification( note : INotification ) : void {
			if (note.getName() == PlaylistModel.READY){
				var datas:Array = note.getBody() as Array;
				for each(var vo:VideoVO in datas){
					pane.addElement(vo);
				}
			}
		}		
		private function onItemClick(event:PlaylistEvent) : void {
			trace(event.item);
			sendNotification(Playlist.SEND_TO_PLAYER, event.item);
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get pane() : PlaylistPane {
			return viewComponent as PlaylistPane;
		}
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}