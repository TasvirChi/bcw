package com.borhan.commands.conversionProfile
{
	import com.borhan.vo.BorhanConversionProfile;
	import com.borhan.delegates.conversionProfile.ConversionProfileAddDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileAdd extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileAdd( conversionProfile : BorhanConversionProfile )
		{
			service= 'conversionprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(conversionProfile,'conversionProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileAddDelegate( this , config );
		}
	}
}
