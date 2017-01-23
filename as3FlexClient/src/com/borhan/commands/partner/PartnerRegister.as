package com.borhan.commands.partner
{
	import com.borhan.vo.BorhanPartner;
	import com.borhan.delegates.partner.PartnerRegisterDelegate;
	import com.borhan.net.BorhanCall;

	public class PartnerRegister extends BorhanCall
	{
		public var filterFields : String;
		public function PartnerRegister( partner : BorhanPartner,cmsPassword : String='' )
		{
			service= 'partner';
			action= 'register';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(partner,'partner');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'cmsPassword' );
			valueArr.push( cmsPassword );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerRegisterDelegate( this , config );
		}
	}
}
