package com.borhan.net {

	import com.borhan.config.BorhanConfig;
	import com.borhan.errors.BorhanError;
	import com.borhan.events.BorhanEvent;

	import flash.net.URLVariables;
	import flash.utils.ByteArray;

	public class BorhanFileCall extends BorhanCall {

		public var bytes : ByteArray;
		public var filterFields : String;
		
		public function BorhanFileCall () {
			super ();
		}
	}
}