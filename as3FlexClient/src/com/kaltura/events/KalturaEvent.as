package com.borhan.events {
	
	import com.borhan.errors.BorhanError;
	
	import flash.events.Event;

	public class BorhanEvent extends Event {
		
		public static const COMPLETE:String = 'complete';
		public static const FAILED:String = 'failed';

		public var success:Boolean;
		public var data:Object;
		public var error:BorhanError;
		
		public function BorhanEvent(type:String,
									 bubbles:Boolean=false,
									 cancelable:Boolean=false,
									 success:Boolean = false,
									 data:Object = null, 
									 error:BorhanError = null) 
		{
			this.success = success;
			this.data = data;
			this.error = error;
			
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			return new BorhanEvent(type, bubbles, cancelable, success, data, error);
		}
		
		override public function toString():String {
			return formatToString('BorhanEvent', 'type', 'success', 'data', 'error');
		}
		
	}
}