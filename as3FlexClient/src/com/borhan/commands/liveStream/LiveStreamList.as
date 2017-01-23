package com.borhan.commands.liveStream
{
	import com.borhan.vo.BorhanLiveStreamEntryFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.liveStream.LiveStreamListDelegate;
	import com.borhan.net.BorhanCall;

	public class LiveStreamList extends BorhanCall
	{
		public var filterFields : String;
		public function LiveStreamList( filter : BorhanLiveStreamEntryFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanLiveStreamEntryFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'livestream';
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
			delegate = new LiveStreamListDelegate( this , config );
		}
	}
}
