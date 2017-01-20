package com.borhan.commands.upload
{
	import com.borhan.delegates.upload.UploadGetUploadedFileTokenByFileNameDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadGetUploadedFileTokenByFileName extends BorhanCall
	{
		public var filterFields : String;
		public function UploadGetUploadedFileTokenByFileName( fileName : String )
		{
			service= 'upload';
			action= 'getUploadedFileTokenByFileName';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'fileName' );
			valueArr.push( fileName );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadGetUploadedFileTokenByFileNameDelegate( this , config );
		}
	}
}
