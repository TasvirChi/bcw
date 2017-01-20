package com.borhan.commands.uploadToken
{
	import com.borhan.delegates.uploadToken.UploadTokenGetDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadTokenGet extends BorhanCall
	{
		public var filterFields : String;
		public function UploadTokenGet( uploadTokenId : String )
		{
			service= 'uploadtoken';
			action= 'get';

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
			delegate = new UploadTokenGetDelegate( this , config );
		}
	}
}
