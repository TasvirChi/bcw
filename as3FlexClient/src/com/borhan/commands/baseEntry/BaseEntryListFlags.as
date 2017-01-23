package com.borhan.commands.baseEntry
{
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.baseEntry.BaseEntryListFlagsDelegate;
	import com.borhan.net.BorhanCall;

	public class BaseEntryListFlags extends BorhanCall
	{
		public var filterFields : String;
		public function BaseEntryListFlags( entryId : String,pager : BorhanFilterPager=null )
		{
			if(pager== null)pager= new BorhanFilterPager();
			service= 'baseentry';
			action= 'listFlags';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BaseEntryListFlagsDelegate( this , config );
		}
	}
}
