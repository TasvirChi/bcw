package com.borhan.commands.systemPartner
{
	import com.borhan.vo.BorhanPartnerFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.systemPartner.SystemPartnerListDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerList extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerList( filter : BorhanPartnerFilter=null,pager : BorhanFilterPager=null )
		{
			if(filter== null)filter= new BorhanPartnerFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'systempartner_systempartner';
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
			delegate = new SystemPartnerListDelegate( this , config );
		}
	}
}
