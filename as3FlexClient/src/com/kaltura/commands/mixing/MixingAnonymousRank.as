package com.borhan.commands.mixing
{
	import com.borhan.delegates.mixing.MixingAnonymousRankDelegate;
	import com.borhan.net.BorhanCall;

	public class MixingAnonymousRank extends BorhanCall
	{
		public var filterFields : String;
		public function MixingAnonymousRank( entryId : String,rank : int )
		{
			service= 'mixing';
			action= 'anonymousRank';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'entryId' );
			valueArr.push( entryId );
			keyArr.push( 'rank' );
			valueArr.push( rank );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MixingAnonymousRankDelegate( this , config );
		}
	}
}
