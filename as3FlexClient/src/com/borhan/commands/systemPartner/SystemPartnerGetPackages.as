package com.borhan.commands.systemPartner
{
	import com.borhan.delegates.systemPartner.SystemPartnerGetPackagesDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerGetPackages extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerGetPackages(  )
		{
			service= 'systempartner_systempartner';
			action= 'getPackages';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerGetPackagesDelegate( this , config );
		}
	}
}
