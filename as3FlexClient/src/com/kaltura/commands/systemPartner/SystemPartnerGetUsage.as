package com.borhan.commands.systemPartner
{
	import com.borhan.vo.BorhanPartnerFilter;
	import com.borhan.vo.BorhanSystemPartnerUsageFilter;
	import com.borhan.vo.BorhanFilterPager;
	import com.borhan.delegates.systemPartner.SystemPartnerGetUsageDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerGetUsage extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerGetUsage( partnerFilter : BorhanPartnerFilter=null,usageFilter : BorhanSystemPartnerUsageFilter=null,pager : BorhanFilterPager=null )
		{
			if(partnerFilter== null)partnerFilter= new BorhanPartnerFilter();
			if(usageFilter== null)usageFilter= new BorhanSystemPartnerUsageFilter();
			if(pager== null)pager= new BorhanFilterPager();
			service= 'systempartner_systempartner';
			action= 'getUsage';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(partnerFilter,'partnerFilter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(usageFilter,'usageFilter');
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
			delegate = new SystemPartnerGetUsageDelegate( this , config );
		}
	}
}
