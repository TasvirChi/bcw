package com.borhan.commands.flavorParams
{
	import com.borhan.delegates.flavorParams.FlavorParamsGetByConversionProfileIdDelegate;
	import com.borhan.net.BorhanCall;

	public class FlavorParamsGetByConversionProfileId extends BorhanCall
	{
		public var filterFields : String;
		public function FlavorParamsGetByConversionProfileId( conversionProfileId : int )
		{
			service= 'flavorparams';
			action= 'getByConversionProfileId';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'conversionProfileId' );
			valueArr.push( conversionProfileId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new FlavorParamsGetByConversionProfileIdDelegate( this , config );
		}
	}
}
