package com.borhan.commands.upload
{
	import com.borhan.vo.File;
	import com.borhan.delegates.upload.UploadUploadDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadUpload extends BorhanCall
	{
		public var filterFields : String;
		public function UploadUpload( fileData : file )
		{
			service= 'upload';
			action= 'upload';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadUploadDelegate( this , config );
		}
	}
}
