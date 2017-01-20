package com.borhan.delegates.bulkUpload
{
	import com.borhan.config.BorhanConfig;
	import com.borhan.core.KClassFactory;
	import com.borhan.delegates.WebDelegateBase;
	import com.borhan.errors.BorhanError;
	import com.borhan.net.BorhanCall;
	
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	
	public class BulkUploadAddDelegate extends WebDelegateBase
	{
		private var _fr : FileReference;
		private var _urlReq : URLRequest;
		private var _hasError : BorhanError;
		
		public function BulkUploadAddDelegate(call:BorhanCall, config:BorhanConfig ,fr : FileReference)
		{
			super(call, config);
			_fr = fr;
			startUpload();
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.borhan.vo.'+ result.result.objectType) as Class;
			var obj : * = (new KClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}
		
		override protected function sendRequest():void {

		}
		
		override protected function onDataComplete(event:Event):void {
			try{
				handleResult( XML( (event as DataEvent).data ) );
			}
			catch( e:Error )
			{
				var kErr : BorhanError = new BorhanError();
				kErr.errorCode = String(e.errorID);
				kErr.errorMsg = e.message;
				_call.handleError( kErr );
			}
		}
		
		override protected function createURLLoader():void {
			
			_fr.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA , onDataComplete );
			_fr.addEventListener(IOErrorEvent.IO_ERROR , onIOError);
			_fr.addEventListener(SecurityErrorEvent.SECURITY_ERROR , onSecurityError);
			_fr.addEventListener(Event.CANCEL , onCancel);
		}
		
		private function startUpload() : void
		{				
			createURLLoader();
			
			var url : String = _config.domain +"/"+_config.srvUrl+"?service="+call.service+"&action="+call.action;
			
			for( var str : String in call.args )
			{	
				url += "&";
				url += str +'='+call.args[str];
			}
			
			_urlReq = new URLRequest( url );
			_fr.upload(_urlReq, "csvFileData");	
		}
		
		private function onIOError( e : IOErrorEvent ) : void
		{
			_hasError = new BorhanError();
			_hasError.errorCode = "-1";
			_hasError.errorMsg = e.text;
			_call.handleError( _hasError );
		}
		
		private function onSecurityError( e : SecurityErrorEvent ) : void
		{
			_hasError = new BorhanError();
			_hasError.errorCode = "-1";
			_hasError.errorMsg = e.text;
			_call.handleError( _hasError );
		}
		
		private function onCancel( e : Event )  : void
		{
			_hasError = new BorhanError();
			_hasError.errorCode = "-1";
			_hasError.errorMsg = e.type;
			_call.handleError( _hasError );
		}	
	}
}
