package com.borhan.commands.user
{
	import com.borhan.vo.BorhanUserFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.user.UserListDelegate;
	import com.borhan.net.BorhanCall;

	public class UserList extends BorhanCall
	{
		public var filterFields : String;
		public function UserList( filter : BorhanUserFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanUserFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'user';
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
			delegate = new UserListDelegate( this , config );
		}
	}
}
