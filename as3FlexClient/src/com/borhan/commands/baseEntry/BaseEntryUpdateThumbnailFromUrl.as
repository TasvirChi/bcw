package com.borhan.commands.baseEntry
{
	import com.borhan.delegates.baseEntry.BaseEntryUpdateThumbnailFromUrlDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryUpdateThumbnailFromUrl extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryUpdateThumbnailFromUrl( entryId : String,url : String )
		{
			service= 'baseentry';
			action= 'updateThumbnailFromUrl';

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
			delegate = new BaseEntryUpdateThumbnailFromUrlDelegate( this , config );
		}
	}
}
