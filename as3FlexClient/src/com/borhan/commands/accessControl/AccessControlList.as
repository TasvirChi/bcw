package com.borhan.commands.accessControl
{
	import com.borhan.vo.BorhanAccessControlFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.accessControl.AccessControlListDelegate;
	import com.borhan.net.BorhanCall;

	public class AccessControlList extends BorhanCall
	{
		public var filterFields : String;
		public function AccessControlList( filter : BorhanAccessControlFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanAccessControlFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'accesscontrol';
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
			delegate = new AccessControlListDelegate( this , config );
		}
	}
}
