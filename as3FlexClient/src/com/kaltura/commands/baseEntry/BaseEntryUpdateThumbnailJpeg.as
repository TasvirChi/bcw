package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryUpdateThumbnailJpegDelegate;
	import com.borhan.net.BorhanFileCall;
	import flash.utils.ByteArray;

	public class BaseEntryUpdateThumbnailJpeg extends BorhanFileCall
	{
		public function BaseEntryUpdateThumbnailJpeg( entryId : String, fileData : ByteArray )
		{
			service= 'baseEntry';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			bytes = fileData;
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailJpegDelegate( this , config );
		}
	}
}
