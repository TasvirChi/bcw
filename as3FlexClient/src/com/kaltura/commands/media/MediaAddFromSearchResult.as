package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntry;
	import com.borhan.vo.BorhanSearchResult;
	import com.borhan.delegates.media.MediaAddFromSearchResultDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaAddFromSearchResult extends BorhanCall
	{
		public var filterFields : String;
		public function MediaAddFromSearchResult( mediaEntry : BorhanMediaEntry=null,searchResult : BorhanSearchResult=null )
		{
			if(mediaEntry== null)mediaEntry= new BorhanMediaEntry();
			if(searchResult== null)searchResult= new BorhanSearchResult();
			service= 'media';
			action= 'addFromSearchResult';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mediaEntry,'mediaEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(searchResult,'searchResult');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MediaAddFromSearchResultDelegate( this , config );
		}
	}
}
