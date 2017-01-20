package com.borhan
{
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	
	import flash.events.EventDispatcher;

	public class BorhanClient extends EventDispatcher
	{	
		protected var _currentConfig:BorhanConfig;
		
		public function BorhanClient( config : BorhanConfig) 
		{
			_currentConfig = config;
		}
		
		//Setters & Getters
		public function get partnerId():String  { return _currentConfig ? this._currentConfig.partnerId : null; }
		public function get domain():String { return _currentConfig ? this._currentConfig.domain : null; }
		
		public function set ks( currentConfig : String ):void  {  _currentConfig.ks = currentConfig; }
		[Bindable]public function get ks():String  { return _currentConfig ? this._currentConfig.ks : null; }
		
		public function set clientTag(value:String):void { _currentConfig.clientTag = value; }
		public function get clientTag():String { return _currentConfig.clientTag; }
		
		
		public function post(call:BorhanCall):BorhanCall {
			if (_currentConfig) {
				call.config = _currentConfig;
				call.initialize();
				call.execute();
			} else {
				throw new Error("Cannot post a call; no borhan config has been set.");
			}
			return call;
		}
	}
}