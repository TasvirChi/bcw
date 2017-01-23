package com.borhan.commands.uploadToken
{
	import com.borhan.vo.BorhanUploadTokenFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.uploadToken.UploadTokenListDelegate;
	import com.borhan.net.BorhanCall;

	public class UploadTokenList extends BorhanCall
	{
		public var filterFields : String;
		public function UploadTokenList( filter : BorhanUploadTokenFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanUploadTokenFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'uploadtoken';
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
			delegate = new UploadTokenListDelegate( this , config );
		}
	}
}
