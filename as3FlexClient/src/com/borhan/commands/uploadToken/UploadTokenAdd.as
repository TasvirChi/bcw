package com.borhan.commands.uploadToken
{
	import com.borhan.vo.BorhanUploadToken;
	import com.borhan.delegates.uploadToken.UploadTokenAddDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadTokenAdd extends BorhanCall
	{
		public var filterFields : String;
		public function UploadTokenAdd( uploadToken : BorhanUploadToken=null )
		{
			if(uploadToken== null)uploadToken= new BorhanUploadToken();
			service= 'uploadtoken';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(uploadToken,'uploadToken');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new UploadTokenAddDelegate( this , config );
		}
	}
}
