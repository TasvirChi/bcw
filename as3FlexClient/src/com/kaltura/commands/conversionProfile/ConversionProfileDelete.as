package com.borhan.commands.conversionProfile
{
	import com.borhan.delegates.conversionProfile.ConversionProfileDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileDelete extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileDelete( id : int )
		{
			service= 'conversionprofile';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new ConversionProfileDeleteDelegate( this , config );
		}
	}
}
