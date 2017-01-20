package com.borhan.commands.upload
{
	import com.borhan.delegates.upload.UploadGetUploadedFileStatusByTokenIdDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadGetUploadedFileStatusByTokenId extends BorhanCall
	{
		public var filterFields : String;
		public function UploadGetUploadedFileStatusByTokenId( uploadTokenId : String )
		{
			service= 'upload';
			action= 'getUploadedFileStatusByTokenId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadedFileStatusByTokenIdDelegate( this , config );
		}
	}
}
