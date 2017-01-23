package com.borhan.commands.bulkUpload
{
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.bulkUpload.BulkUploadListDelegate;
	import com.borhan.net.BorhanCall;

	public class BulkUploadList extends BorhanCall
	{
		public var filterFields : String;
		public function BulkUploadList( pager : BorhanFilterPager=null )
		{
			if(pager== null)pager= new BorhanFilterPager();
			service= 'bulkupload';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(pager,'pager');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new BulkUploadListDelegate( this , config );
		}
	}
}
