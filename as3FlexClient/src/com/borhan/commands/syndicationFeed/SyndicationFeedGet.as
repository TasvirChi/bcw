package com.borhan.commands.syndicationFeed
{
	import com.borhan.delegates.syndicationFeed.SyndicationFeedGetDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedGet extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedGet( id : String )
		{
			service= 'syndicationfeed';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedGetDelegate( this , config );
		}
	}
}
