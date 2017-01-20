package com.borhan.commands.conversionProfile
{
	import com.borhan.vo.BorhanFlavorAsset;
	import com.borhan.vo.BorhanFlavorParams;
	import com.borhan.delegates.conversionProfile.ConversionProfileDummyDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileDummy extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileDummy( a : BorhanFlavorAsset,b : BorhanFlavorParams )
		{
			service= 'conversionProfile';
			action= 'dummy';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(a,'a');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
 			keyValArr = borhanObject2Arrays(b,'b');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileDummyDelegate( this , config );
		}
	}
}
