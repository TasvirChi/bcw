package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntry;
	import com.borhan.delegates.media.MediaAddFromUrlDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaAddFromUrl extends BorhanCall
	{
		public var filterFields : String;
		public function MediaAddFromUrl( mediaEntry : BorhanMediaEntry,url : String )
		{
			service= 'media';
			action= 'addFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'url' );
			valueArr.push( url );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromUrlDelegate( this , config );
		}
	}
}
