package com.borhan.errors {
	
	import flash.events.ErrorEvent;
	import flash.net.URLVariables;
	
	public class BorhanError 
	{
		//Data returned from the Service
		public var errorCode:String;
		public var errorMsg:String;
		public var requestArgs:URLVariables;
	}
}