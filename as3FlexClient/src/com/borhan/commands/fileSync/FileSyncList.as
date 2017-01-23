package com.borhan.commands.fileSync
{
	import com.borhan.vo.BorhanFileSyncFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.fileSync.FileSyncListDelegate;
	import com.borhan.net.BorhanCall;

	public class FileSyncList extends BorhanCall
	{
		public var filterFields : String;
		public function FileSyncList( filter : BorhanFileSyncFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanFileSyncFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'filesync_filesync';
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
			delegate = new FileSyncListDelegate( this , config );
		}
	}
}
