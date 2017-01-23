package com.borhan.commands.playlist
{
	import com.borhan.delegates.playlist.PlaylistDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistDelete extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistDelete( id : String )
		{
			service= 'playlist';
			action= 'delete';

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
			delegate = new PlaylistDeleteDelegate( this , config );
		}
	}
}
