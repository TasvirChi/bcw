package com.borhan.commands.systemPartner
{
	import com.borhan.delegates.systemPartner.SystemPartnerGetDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerGet extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerGet( partnerId : int )
		{
			service= 'systempartner_systempartner';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetDelegate( this , config );
		}
	}
}
