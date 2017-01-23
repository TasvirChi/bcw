package com.borhan.commands.systemUser
{
	import com.borhan.vo.BorhanSystemUserFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.systemUser.SystemUserListDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemUserList extends BorhanCall
	{
		public var filterFields : String;
		public function SystemUserList( filter : BorhanSystemUserFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanSystemUserFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'systemuser_systemuser';
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
			delegate = new SystemUserListDelegate( this , config );
		}
	}
}
