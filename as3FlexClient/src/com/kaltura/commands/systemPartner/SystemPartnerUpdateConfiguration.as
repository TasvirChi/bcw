package com.borhan.commands.systemPartner
{
	import com.borhan.vo.BorhanSystemPartnerConfiguration;
	import com.borhan.delegates.systemPartner.SystemPartnerUpdateConfigurationDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerUpdateConfiguration extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerUpdateConfiguration( partnerId : int,configuration : BorhanSystemPartnerConfiguration )
		{
			service= 'systempartner_systempartner';
			action= 'updateConfiguration';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
 			keyValArr = borhanObject2Arrays(configuration,'configuration');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerUpdateConfigurationDelegate( this , config );
		}
	}
}
