/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.player.controller.InitPlayer
 * @date:		Nov 12, 2009
 */
package com.wearevi.fei.player.controller 
{
	import com.wearevi.fei.player.Player;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import org.puremvc.as3.multicore.interfaces.INotification;
	import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
	
	public class InitPlayer extends SimpleCommand 
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		override public function execute(notification:INotification) : void {
			var player:Player = Player.getInstance(FEIVideo_Home.PLAYER_NAME);
			var index:int = 0;
			
			// meaning that's the the discipline instance running
			if (Player.getInstance(FEIVideo_Home.PLAYLIST_NAME)) {
				index = Math.round(Math.random() * (notification.getBody() as Array).length);
			} else {
				player.playVideo(notification.getBody()[index] as VideoVO);
			}
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}