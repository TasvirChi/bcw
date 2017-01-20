package com.borhan.commands.playlist
{
	import com.borhan.delegates.playlist.PlaylistExecuteDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistExecute extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistExecute( id : String,detailed : String='' )
		{
			service= 'playlist';
			action= 'execute';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			keyArr.push( 'detailed' );
			valueArr.push( detailed );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistExecuteDelegate( this , config );
		}
	}
}
