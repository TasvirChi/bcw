package com.borhan.commands.liveStream
{
	import com.borhan.vo.File;
	import com.borhan.delegates.liveStream.LiveStreamUpdateOfflineThumbnailJpegDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamUpdateOfflineThumbnailJpeg extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamUpdateOfflineThumbnailJpeg( entryId : String,fileData : file )
		{
			service= 'livestream';
			action= 'updateOfflineThumbnailJpeg';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(fileData,'fileData');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamUpdateOfflineThumbnailJpegDelegate( this , config );
		}
	}
}
