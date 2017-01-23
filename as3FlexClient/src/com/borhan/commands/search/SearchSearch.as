package com.borhan.commands.search
{
	import com.borhan.vo.BorhanSearch;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.search.SearchSearchDelegate;
	import com.borhan.net.BorhanCall;

	public class SearchSearch extends BorhanCall
	{
		public var filterFields : String;
		public function SearchSearch( search : BorhanSearch,pager : BorhanFilterPager=null )
		{
			if(pager== null)pager= new BorhanFilterPager();
			service= 'search';
			action= 'search';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(search,'search');
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
			delegate = new SearchSearchDelegate( this , config );
		}
	}
}
