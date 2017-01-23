package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingDelete extends BorhanCall
	{
		public var filterFields : String;
		public function MixingDelete( entryId : String )
		{
			service= 'mixing';
			action= 'delete';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingDeleteDelegate( this , config );
		}
	}
}
