package com.borhan.commands.mixing
{
	import com.borhan.vo.BorhanMediaEntryFilter;
	import com.borhan.delegates.mixing.MixingCountDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingCount extends BorhanCall
	{
		public var filterFields : String;
		public function MixingCount( filter : BorhanMediaEntryFilter=null )
		{
			if(filter== null)filter= new BorhanMediaEntryFilter();
			service= 'mixing';
			action= 'count';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(filter,'filter');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingCountDelegate( this , config );
		}
	}
}
