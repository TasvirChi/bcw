package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingRequestFlatteningDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingRequestFlattening extends BorhanCall
	{
		public var filterFields : String;
		public function MixingRequestFlattening( entryId : String,fileFormat : String,version : int=-1 )
		{
			service= 'mixing';
			action= 'requestFlattening';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'fileFormat' );
			valueArr.push( fileFormat );
			keyArr.push( 'version' );
			valueArr.push( version );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingRequestFlatteningDelegate( this , config );
		}
	}
}
