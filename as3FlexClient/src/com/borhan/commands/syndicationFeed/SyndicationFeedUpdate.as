package com.borhan.commands.syndicationFeed
{
	import com.borhan.vo.BorhanBaseSyndicationFeed;
	import com.borhan.delegates.syndicationFeed.SyndicationFeedUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedUpdate( id : String,syndicationFeed : BorhanBaseSyndicationFeed )
		{
			service= 'syndicationfeed';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(syndicationFeed,'syndicationFeed');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedUpdateDelegate( this , config );
		}
	}
}
