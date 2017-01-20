package com.borhan.commands.partner
{
	import com.borhan.delegates.partner.PartnerGetInfoDelegate;
	import com.borhan.net.BorhanCall;

	public class PartnerGetInfo extends BorhanCall
	{
		public var filterFields : String;
		public function PartnerGetInfo(  )
		{
			service= 'partner';
			action= 'getInfo';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerGetInfoDelegate( this , config );
		}
	}
}
