package com.borhan.commands.upload
{
	import com.borhan.delegates.upload.UploadGetUploadTokenIdDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadGetUploadTokenId extends BorhanCall
	{
		public var filterFields : String;
		public function UploadGetUploadTokenId(  )
		{
			service= 'upload';
			action= 'getUploadTokenId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadTokenIdDelegate( this , config );
		}
	}
}
