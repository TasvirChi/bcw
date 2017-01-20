package com.borhan.commands.syndicationFeed
{
	import com.borhan.delegates.syndicationFeed.SyndicationFeedGetEntryCountDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedGetEntryCount extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedGetEntryCount( feedId : String )
		{
			service= 'syndicationfeed';
			action= 'getEntryCount';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'feedId' );
			valueArr.push( feedId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedGetEntryCountDelegate( this , config );
		}
	}
}
