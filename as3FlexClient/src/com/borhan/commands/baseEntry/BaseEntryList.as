package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanBaseEntryFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.baseEntry.BaseEntryListDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryList extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryList( filter : BorhanBaseEntryFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanBaseEntryFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'baseentry';
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
			delegate = new BaseEntryListDelegate( this , config );
		}
	}
}
