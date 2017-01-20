package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingGetDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingGet extends BorhanCall
	{
		public var filterFields : String;
		public function MixingGet( entryId : String,version : int=-1 )
		{
			service= 'mixing';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingGetDelegate( this , config );
		}
	}
}
