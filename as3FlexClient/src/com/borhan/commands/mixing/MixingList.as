package com.borhan.commands.mixing
{
	import com.borhan.vo.BorhanMixEntryFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.mixing.MixingListDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingList extends BorhanCall
	{
		public var filterFields : String;
		public function MixingList( filter : BorhanMixEntryFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanMixEntryFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'mixing';
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
			delegate = new MixingListDelegate( this , config );
		}
	}
}
