package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaUpdateThumbnailFromSourceEntryDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaUpdateThumbnailFromSourceEntry extends BorhanCall
	{
		public var filterFields : String;
		public function MediaUpdateThumbnailFromSourceEntry( entryId : String,sourceEntryId : String,timeOffset : int )
		{
			service= 'media';
			action= 'updateThumbnailFromSourceEntry';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'sourceEntryId' );
			valueArr.push( sourceEntryId );
			keyArr.push( 'timeOffset' );
			valueArr.push( timeOffset );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaUpdateThumbnailFromSourceEntryDelegate( this , config );
		}
	}
}
