package com.borhan.delegates {
	
	import com.borhan.config.IBorhanConfig;
	import com.borhan.net.BorhanCall;
	
	import flash.events.IEventDispatcher;
	
	public interface IBorhanCallDelegate extends IEventDispatcher {
		
		function close():void;
		
		function get call():BorhanCall;
		function set call(newVal:BorhanCall):void;
		
		function get config():IBorhanConfig;
		function set config(newVal:IBorhanConfig):void;
	}
	
}