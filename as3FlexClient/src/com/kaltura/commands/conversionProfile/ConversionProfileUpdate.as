package com.borhan.commands.conversionProfile
{
	import com.borhan.vo.BorhanConversionProfile;
	import com.borhan.delegates.conversionProfile.ConversionProfileUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileUpdate( id : int,conversionProfile : BorhanConversionProfile )
		{
			service= 'conversionprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(conversionProfile,'conversionProfile');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileUpdateDelegate( this , config );
		}
	}
}
