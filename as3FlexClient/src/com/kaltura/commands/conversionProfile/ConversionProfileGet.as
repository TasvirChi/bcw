package com.borhan.commands.conversionProfile
{
	import com.borhan.delegates.conversionProfile.ConversionProfileGetDelegate;
	import com.borhan.net.BorhanCall;

	public class ConversionProfileGet extends BorhanCall
	{
		public var filterFields : String;
		public function ConversionProfileGet( id : int )
		{
			service= 'conversionprofile';
			action= 'get';

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
			delegate = new ConversionProfileGetDelegate( this , config );
		}
	}
}
