package com.borhan.commands.data
{
	import com.borhan.vo.BorhanDataEntryFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.data.DataListDelegate;
	import com.borhan.net.BorhanCall;

	public class DataList extends BorhanCall
	{
		public var filterFields : String;
		public function DataList( filter : BorhanDataEntryFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanDataEntryFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'data';
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
			delegate = new DataListDelegate( this , config );
		}
	}
}
