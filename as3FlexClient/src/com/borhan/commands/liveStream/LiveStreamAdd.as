package com.borhan.commands.liveStream
{
	import com.borhan.vo.BorhanLiveStreamAdminEntry;
	import com.borhan.delegates.liveStream.LiveStreamAddDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamAdd extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamAdd( liveStreamEntry : BorhanLiveStreamAdminEntry )
		{
			service= 'livestream';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(liveStreamEntry,'liveStreamEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamAddDelegate( this , config );
		}
	}
}
