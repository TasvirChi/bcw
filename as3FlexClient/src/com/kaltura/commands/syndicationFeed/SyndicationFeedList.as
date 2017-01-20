package com.borhan.commands.syndicationFeed
{
	import com.borhan.vo.BorhanBaseSyndicationFeedFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.syndicationFeed.SyndicationFeedListDelegate;
	import com.borhan.net.BorhanCall;

	public class SyndicationFeedList extends BorhanCall
	{
		public var filterFields : String;
		public function SyndicationFeedList( filter : BorhanBaseSyndicationFeedFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanBaseSyndicationFeedFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'syndicationfeed';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SyndicationFeedListDelegate( this , config );
		}
	}
}
