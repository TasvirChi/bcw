package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntry;
	import com.borhan.delegates.media.MediaAddFromUploadedFileDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaAddFromUploadedFile extends BorhanCall
	{
		public var filterFields : String;
		public function MediaAddFromUploadedFile( mediaEntry : BorhanMediaEntry,uploadTokenId : String )
		{
			service= 'media';
			action= 'addFromUploadedFile';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'uploadTokenId' );
			valueArr.push( uploadTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromUploadedFileDelegate( this , config );
		}
	}
}
