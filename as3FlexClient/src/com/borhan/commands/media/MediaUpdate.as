package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntry;
	import com.borhan.delegates.media.MediaUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function MediaUpdate( entryId : String,mediaEntry : BorhanMediaEntry )
		{
			service= 'media';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaUpdateDelegate( this , config );
		}
	}
}
