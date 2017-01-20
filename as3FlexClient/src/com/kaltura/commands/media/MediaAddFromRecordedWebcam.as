package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntry;
	import com.borhan.delegates.media.MediaAddFromRecordedWebcamDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaAddFromRecordedWebcam extends BorhanCall
	{
		public var filterFields : String;
		public function MediaAddFromRecordedWebcam( mediaEntry : BorhanMediaEntry,webcamTokenId : String )
		{
			service= 'media';
			action= 'addFromRecordedWebcam';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'webcamTokenId' );
			valueArr.push( webcamTokenId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromRecordedWebcamDelegate( this , config );
		}
	}
}
