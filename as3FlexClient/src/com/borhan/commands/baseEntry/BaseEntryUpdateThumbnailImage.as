package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryUpdateThumbnailImageDelegate;
	import com.borhan.net.BorhanFileCall;
	
	import flash.net.FileReference;

	public class BaseEntryUpdateThumbnailImage extends BorhanFileCall
	{
		
		
		public var fileData:FileReference;
		
		public function BaseEntryUpdateThumbnailImage( entryId : String, fileData : FileReference )
		{
			service= 'baseEntry';
			action= 'updateThumbnailJpeg';
			applySchema(['entryId'] , [entryId]);
			this.fileData = fileData;
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryUpdateThumbnailImageDelegate( this , config );
		}
	}
}
