/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.player.Player | Player.as
 * @date:		29 juin 2009
 * @version:	1.0.0
 */
package com.wearevi.fei.player {
	import com.wearevi.fei.player.model.PlayerModel;
	import com.wearevi.fei.player.view.PlayerMediator;
	import com.wearevi.fei.player.view.patterns.PlayerPane;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import org.puremvc.as3.multicore.interfaces.IFacade;
	import org.puremvc.as3.multicore.patterns.facade.Facade;

	public class Player extends Facade implements IFacade {
//- CONSTANTS ---------------------------------------------------------------------------------------------

//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var playerModel:PlayerModel;
//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function Player(key:String) {
			super(key);
		}
		
//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		override protected function initializeModel() : void {
			super.initializeModel();
			registerProxy(playerModel = new PlayerModel());
		}
		
//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function startup( frame : PlayerPane ) : void {
			registerMediator(new PlayerMediator(frame));
		}
		
		public function playVideo(value:VideoVO) : void {
			playerModel.play(value);
		}

		public static function getInstance(key:String) : Player {
			if ( instanceMap[ key ] == null ) instanceMap[ key ] = new Player(key);
			return instanceMap[ key ] as Player;
		}
//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		
//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
