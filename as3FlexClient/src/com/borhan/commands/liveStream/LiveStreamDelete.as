package com.borhan.commands.liveStream
{
	import com.borhan.delegates.liveStream.LiveStreamDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamDelete extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamDelete( entryId : String )
		{
			service= 'livestream';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new LiveStreamDeleteDelegate( this , config );
		}
	}
}
