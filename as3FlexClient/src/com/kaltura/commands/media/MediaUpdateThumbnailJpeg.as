package com.borhan.commands.media
{
	import com.borhan.delegates.media.MediaUpdateThumbnailJpegDelegate;
	import com.borhan.net.BorhanFileCall;

	import flash.utils.ByteArray;

	public class MediaUpdateThumbnailJpeg extends BorhanFileCall
	{
		public function MediaUpdateThumbnailJpeg( entryId : String, fileData : ByteArray )
		{
			service= 'media';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			bytes = fileData;
		}

		override public function execute() : void
		{
			delegate = new MediaUpdateThumbnailJpegDelegate( this , config );
		}
	}
}
