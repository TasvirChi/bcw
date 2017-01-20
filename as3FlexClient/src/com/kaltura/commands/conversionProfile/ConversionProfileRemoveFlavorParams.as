package com.borhan.commands.conversionProfile
{
	import com.borhan.delegates.conversionProfile.ConversionProfileRemoveFlavorParamsDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileRemoveFlavorParams extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileRemoveFlavorParams( conversionProfileId : int,conversionParamsId : int )
		{
			service= 'conversionProfile';
			action= 'removeFlavorParams';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'conversionProfileId' );
			valueArr.push( conversionProfileId );
			keyArr.push( 'conversionParamsId' );
			valueArr.push( conversionParamsId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileRemoveFlavorParamsDelegate( this , config );
		}
	}
}
