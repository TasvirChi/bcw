package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingCloneDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingClone extends BorhanCall
	{
		public var filterFields : String;
		public function MixingClone( entryId : String )
		{
			service= 'mixing';
			action= 'clone';

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
			delegate = new MixingCloneDelegate( this , config );
		}
	}
}
