package com.borhan.commands.mediaInfo
{
	import com.borhan.vo.BorhanMediaInfoFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.mediaInfo.MediaInfoListDelegate;
	import com.borhan.net.BorhanCall;

	public class MediaInfoList extends BorhanCall
	{
		public var filterFields : String;
		public function MediaInfoList( filter : BorhanMediaInfoFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanMediaInfoFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'adminconsole_mediainfo';
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
			delegate = new MediaInfoListDelegate( this , config );
		}
	}
}
