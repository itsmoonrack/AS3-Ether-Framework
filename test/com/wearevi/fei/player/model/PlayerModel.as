/**
 * @author:		Sylvain Lecoy / We Are VI - London [http://www.wearevi.com]
 * @class:		com.wearevi.player.model.PlayerProxy | PlayerProxy.as
 * @date:		1 juillet 2009
 * @version:	1.0.1
 */
package com.wearevi.fei.player.model {
	import com.wearevi.fei.player.vo.VideoVO;
	
	import flash.events.NetStatusEvent;
	import flash.media.SoundTransform;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	import org.puremvc.as3.multicore.interfaces.IProxy;
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;

	public class PlayerModel extends Proxy implements IProxy {
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const NAME : String = 'Player';
		public static const READY : String = NAME + '.Ready';
		public static const PLAYING : String = NAME + '.Playing';
		public static const PAUSED : String = NAME + '.Paused';
		public static const STOPPED : String = NAME + '.Stopped';
		public static const BUFFERING : String = NAME + '.Buffering';
		public static const BUFFER_FULL : String = NAME + '.BufferFull';
		public static const SOUND_CHANGED : String = NAME + '.SoundChanged';
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var sndTransform : SoundTransform = new SoundTransform(.7);
		
		private var _conn_nc : NetConnection;
		private var _stopped : Boolean = false;
		private var _duration : Number;
		private var _prev_vol : Number = .7;
		private var _current_playing : VideoVO;

		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlayerModel() {
			super(NAME);
			
			_conn_nc = new NetConnection();
			_conn_nc.connect(null);
			_conn_nc.addEventListener(NetStatusEvent.NET_STATUS, onConnNetStatus);
			
			setData(new NetStream(_conn_nc));
			stream_ns.bufferTime = 3;
			stream_ns.addEventListener(NetStatusEvent.NET_STATUS, handleNetStreamStatus);
			
			var netClient : Object = new Object();
			netClient.onMetaData = function(meta : Object):void {
				_duration = meta["duration"];
			};
			stream_ns.client = netClient;
		
		}
		override public function onRegister() : void {
			setVol(_prev_vol);
			trace(READY);
			sendNotification(READY);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------
		
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function play(video:VideoVO = null) : void {
			if(video) {
				stream_ns.close();
				stream_ns.play(video.url);
				_current_playing = video;
				trace(PLAYING);
				sendNotification(PLAYING, video);
			} else _stopped?play(_current_playing):resume();	
			_stopped = false;
		}
		public function pause() : void {
			trace(PAUSED);
			stream_ns.pause();
			sendNotification(PAUSED);
		}
		public function resume() : void {
			trace(PLAYING);
			stream_ns.resume();
			sendNotification(PLAYING);
		}
		public function stop() : void {
			trace(STOPPED);
			_stopped = true;
			stream_ns.close();
			sendNotification(STOPPED);
		}
		public function seekTo($val : Number) : void {
			if ($val < 1) { 
				$val *= _duration;
			 	stream_ns.seek($val);
			} else stop();
		}
		public function setVol($val : Number) : void {
			var sndTransform : SoundTransform = new SoundTransform($val);
			stream_ns.soundTransform = sndTransform;
			sendNotification(SOUND_CHANGED, $val);
		}
		public function setMute() : void {
			_prev_vol = volume;
			setVol(0);			
		}
		public function setUnMute() : void {
			setVol(_prev_vol);
		}
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function onConnNetStatus(event : NetStatusEvent) : void {
			trace("conection status: ");
			for(var prop:String in event.info) {
				trace("\t" + prop + ": " + event.info[prop]);
			}
		}
		private function handleNetStreamStatus(event : NetStatusEvent) : void {
			switch(event.info.code) {
				case "NetStream.Play.Start":
					trace(BUFFERING);
					sendNotification(BUFFERING);
					break;
				case "NetStream.Buffer.Full":
					if(!_stopped) trace(BUFFER_FULL);
					if(!_stopped) sendNotification(BUFFER_FULL);
					break;
				case "NetStream.Play.Stop":
					trace(STOPPED);
					_stopped = true;
					sendNotification(STOPPED);
					break;
				case "NetStream.Buffer.Empty":
					if(!_stopped) trace(BUFFERING);
					if(!_stopped) sendNotification(BUFFERING);
					break;
				case "NetStream.Play.StreamNotFound":
					trace("NetStream.Play.StreamNotFound");
					break;
			}
		}			
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get media_loaded() : Number {
			return stream_ns.bytesLoaded / stream_ns.bytesTotal;
		}
		public function get elapsed_time() : Number {
			return stream_ns.time / _duration;
		}
		public function get stream_ns() : NetStream {
			return data as NetStream;
		}
		public function get volume() : Number {
			return stream_ns.soundTransform.volume;
		}
//- HELPERS -----------------------------------------------------------------------------------------------
		
//- END CLASS ---------------------------------------------------------------------------------------------
	}
}
