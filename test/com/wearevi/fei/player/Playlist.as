/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.Playlist
 * @date:		Nov 10, 2009
 */
package com.wearevi.fei.player 
{
	import com.wearevi.fei.player.controller.InitPlayer;
	import com.wearevi.fei.player.controller.PlayVideo;
	import com.wearevi.fei.player.model.PlaylistModel;
	import com.wearevi.fei.player.view.PlaylistMediator;
	import com.wearevi.fei.player.view.patterns.PlaylistPane;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;
	
	public class Playlist extends Facade implements IFacade 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const SEND_TO_PLAYER:String = 'SEND_URL_TO_PLAYER';
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var playlistModel:PlaylistModel;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function Playlist(key:String)
		{
			super(key);
		}
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		override protected function initializeController() : void {
			super.initializeController();
			registerCommand(SEND_TO_PLAYER, PlayVideo);
			registerCommand(PlaylistModel.READY, InitPlayer);
		}
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function startup( frame:PlaylistPane ) : void {
			registerMediator(new PlaylistMediator(frame));
		}
		public function setXMLPlaylist(url:String) : void {
			registerProxy(playlistModel = new PlaylistModel(url));
		}
		
		public static function getInstance(key:String) : Playlist {
			if ( instanceMap[ key ] == null ) instanceMap[ key ] = new Playlist(key);
			return instanceMap[ key ] as Playlist;
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}