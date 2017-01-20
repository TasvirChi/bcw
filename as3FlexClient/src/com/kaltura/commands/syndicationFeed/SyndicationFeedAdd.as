package com.borhan.commands.syndicationFeed
{
	import com.borhan.vo.BorhanBaseSyndicationFeed;
	import com.borhan.delegates.syndicationFeed.SyndicationFeedAddDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedAdd extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedAdd( syndicationFeed : BorhanBaseSyndicationFeed )
		{
			service= 'syndicationfeed';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(syndicationFeed,'syndicationFeed');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedAddDelegate( this , config );
		}
	}
}
