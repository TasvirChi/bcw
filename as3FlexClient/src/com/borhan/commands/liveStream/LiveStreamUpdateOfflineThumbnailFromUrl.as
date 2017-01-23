package com.borhan.commands.liveStream
{
	import com.borhan.delegates.liveStream.LiveStreamUpdateOfflineThumbnailFromUrlDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamUpdateOfflineThumbnailFromUrl extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamUpdateOfflineThumbnailFromUrl( entryId : String,url : String )
		{
			service= 'livestream';
			action= 'updateOfflineThumbnailFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamUpdateOfflineThumbnailFromUrlDelegate( this , config );
		}
	}
}
