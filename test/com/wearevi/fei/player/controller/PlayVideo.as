/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.controller.PlayVideo
 * @date:		Nov 10, 2009
 */
package com.wearevi.fei.player.controller 
{
	import com.wearevi.fei.player.Player;
	import com.wearevi.fei.player.Playlist;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class PlayVideo extends SimpleCommand 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		override public function execute(notification:INotification) : void {
			Player.getInstance(FEIVideo_Home.PLAYER_NAME).playVideo(notification.getBody() as VideoVO);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}