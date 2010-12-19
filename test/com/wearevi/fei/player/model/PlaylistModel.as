/**
 * @author:		Sylvain Lecoy [sylvain.lecoy@gmail.com]
 * @class:		com.wearevi.fei.playlist.model.Playlist
 * @date:		Nov 9, 2009
 * @version:	0.9.9
 */
package com.wearevi.fei.player.model 
{
	import com.wearevi.fei.player.Playlist;
	import com.wearevi.fei.player.vo.VideoVO;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	import org.puremvc.as3.multicore.patterns.proxy.Proxy;
	
	
	public class PlaylistModel extends Proxy
	{
		//- CONSTANTS ---------------------------------------------------------------------------------------------
		public static const NAME : String = 'Playlist';
		public static const READY : String = NAME + '.Ready';
		
		//- PRIVATE & PROTECTED VARIABLES -------------------------------------------------------------------------
		private var _playlist:Array;
		private var _current_playing:Number;
		
		//- PUBLIC & INTERNAL VARIABLES ---------------------------------------------------------------------------
		
		//- CONSTRUCTOR	-------------------------------------------------------------------------------------------
		public function PlaylistModel(xmlPath:String)
		{
			super(NAME);
			_playlist = [];
			_current_playing = 0;
			setXMLPath(xmlPath);
		}
		//- PRIVATE & PROTECTED METHODS ---------------------------------------------------------------------------		
		private function buildPlaylist($xml : XML) : void {
			var list : XMLList = new XMLList($xml.player.video);
			for (var i : int = 0;i < list.length(); i++) {
				var vo:VideoVO = new VideoVO();
				vo.url = list[i].@url;
				vo.title = list[i].@title;
				_playlist[i] = vo; 
			}
			sendNotification(READY, playlist);
		}	
		//- PUBLIC & INTERNAL METHODS -----------------------------------------------------------------------------
		public function clip_id($val : Number) : String {
			_current_playing = $val;
			return _playlist[_current_playing].url;
		}		
		public function setXMLPath($xmlPath : String) : void {
			var loader : URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			loader.addEventListener(Event.COMPLETE, complete);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, codeHTTP);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorLoading);
			
			loader.load(new URLRequest($xmlPath));				
		}
		
		//- EVENT HANDLERS ----------------------------------------------------------------------------------------
		private function errorLoading(event : IOErrorEvent) : void {
			trace("IO Error");
		}
		private function codeHTTP(event : HTTPStatusEvent) : void {
			trace("HTTP Error :", event.status);
		}
		private function complete(event : Event) : void {
			buildPlaylist(new XML(event.target.data));
		}
		
		//- GETTERS & SETTERS -------------------------------------------------------------------------------------
		public function get current_playing() : Number {
			return _current_playing;	
		}
		public function get current_title() : String {
			return _playlist[_current_playing].title;
		}
		public function get next() : Number {
			return ++_current_playing % _playlist.length;
		}
		public function get previous() : Number {
			return (_current_playing > 0 ? --_current_playing % _playlist.length : _playlist.length - 1);
		}
		public function get playlist() : Array {
			return _playlist;
		}
		
		//- HELPERS -----------------------------------------------------------------------------------------------
		
		//- END CLASS ---------------------------------------------------------------------------------------------
	}
}