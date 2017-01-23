package com.borhan.commands.search
{
	import com.borhan.vo.BorhanSearchResult;
	import com.borhan.delegates.search.SearchGetMediaInfoDelegate;
	import com.borhan.net.BorhanCall;

	public class SearchGetMediaInfo extends BorhanCall
	{
		public var filterFields : String;
		public function SearchGetMediaInfo( searchResult : BorhanSearchResult )
		{
			service= 'search';
			action= 'getMediaInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(searchResult,'searchResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SearchGetMediaInfoDelegate( this , config );
		}
	}
}
