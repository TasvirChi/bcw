package com.borhan.commands.syndicationFeed
{
	import com.borhan.delegates.syndicationFeed.SyndicationFeedRequestConversionDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedRequestConversion extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedRequestConversion( feedId : String )
		{
			service= 'syndicationfeed';
			action= 'requestConversion';

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
			delegate = new SyndicationFeedRequestConversionDelegate( this , config );
		}
	}
}
