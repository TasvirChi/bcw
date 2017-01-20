package com.borhan.commands.mixing
{
	import com.borhan.vo.BorhanMixEntry;
	import com.borhan.delegates.mixing.MixingAddDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingAdd extends BorhanCall
	{
		public var filterFields : String;
		public function MixingAdd( mixEntry : BorhanMixEntry )
		{
			service= 'mixing';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(mixEntry,'mixEntry');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingAddDelegate( this , config );
		}
	}
}
