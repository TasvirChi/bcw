package com.borhan.commands.liveStream
{
	import com.borhan.vo.BorhanLiveStreamAdminEntry;
	import com.borhan.delegates.liveStream.LiveStreamUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamUpdate( entryId : String,liveStreamEntry : BorhanLiveStreamAdminEntry )
		{
			service= 'livestream';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(liveStreamEntry,'liveStreamEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamUpdateDelegate( this , config );
		}
	}
}
