package com.borhan.commands.playlist
{
	import com.borhan.delegates.playlist.PlaylistExecuteFromFiltersDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistExecuteFromFilters extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistExecuteFromFilters( filters : Array,totalResults : int,detailed : String='' )
		{
			service= 'playlist';
			action= 'executeFromFilters';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = extractArray(filters,'filters');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'totalResults' );
			valueArr.push( totalResults );
			keyArr.push( 'detailed' );
			valueArr.push( detailed );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistExecuteFromFiltersDelegate( this , config );
		}
	}
}
