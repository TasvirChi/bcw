package com.borhan.commands.systemPartner
{
	import com.borhan.delegates.systemPartner.SystemPartnerUpdateStatusDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemPartnerUpdateStatus extends BorhanCall
	{
		public var filterFields : String;
		public function SystemPartnerUpdateStatus( partnerId : int,status : int )
		{
			service= 'systempartner_systempartner';
			action= 'updateStatus';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'partnerId' );
			valueArr.push( partnerId );
			keyArr.push( 'status' );
			valueArr.push( status );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemPartnerUpdateStatusDelegate( this , config );
		}
	}
}
