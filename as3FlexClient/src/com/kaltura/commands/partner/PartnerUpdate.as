package com.borhan.commands.partner
{
	import com.borhan.vo.BorhanPartner;
	import com.borhan.delegates.partner.PartnerUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class PartnerUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function PartnerUpdate( partner : BorhanPartner,allowEmpty : Boolean=false )
		{
			service= 'partner';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(partner,'partner');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'allowEmpty' );
			valueArr.push( allowEmpty );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PartnerUpdateDelegate( this , config );
		}
	}
}
