package com.borhan.commands.media
{
	import com.borhan.vo.BorhanMediaEntryFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.media.MediaListDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaList extends BorhanCall
	{
		public var filterFields : String;
		public function MediaList( filter : BorhanMediaEntryFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanMediaEntryFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'media';
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
			delegate = new MediaListDelegate( this , config );
		}
	}
}
