package com.borhan.delegates.baseEntry
{
	import com.borhan.commands.baseEntry.BaseEntryUpdateThumbnailImage;
	import com.borhan.config.BorhanConfig;
	import com.borhan.core.KClassFactory;
	import com.borhan.delegates.WebDelegateBase;
	import com.borhan.errors.BorhanError;
	import com.borhan.net.BorhanCall;
	
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.utils.getDefinitionByName;
	
	import ru.inspirit.net.MultipartURLLoader;
	
	public class BaseEntryUpdateThumbnailImageDelegate extends WebDelegateBase
	{
		protected var mrloader:MultipartURLLoader;
		
		public function BaseEntryUpdateThumbnailImageDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.borhan.vo.'+ result.result.objectType) as Class;
			var obj : * = (new KClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}
		
		override protected function sendRequest():void {
			//construct the loader
			createURLLoader();

			//create the service request for normal calls
			var variables:String = decodeURIComponent(call.args.toString());
			var req:String = _config.domain +"/"+_config.srvUrl+"?service="+call.service+"&action="+call.action +'&'+variables;
			//mrloader.addFile((call as BaseEntryUpdateThumbnailImage).fileData, UIDUtil.createUID(), 'fileData');
/* 			mrloader.dataFormat = URLLoaderDataFormat.TEXT;
			mrloader.load(req); */
			(call as BaseEntryUpdateThumbnailImage).fileData.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,onDataComplete);
			var urlRequest:URLRequest = new URLRequest(req);
			(call as BaseEntryUpdateThumbnailImage).fileData.upload(urlRequest,'fileData');
		}

		// Event Handlers
		override protected function onDataComplete(event:Event):void {
			//Tell Boaz I did that and check with him about the error different handling
			try{
				handleResult( XML(event["data"]) );
				
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
			mrloader = new MultipartURLLoader();
			mrloader.addEventListener(Event.COMPLETE, onDataComplete);
		}

	}
}
