package com.borhan.commands.playlist
{
	import com.borhan.delegates.playlist.PlaylistGetStatsFromContentDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistGetStatsFromContent extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistGetStatsFromContent( playlistType : int,playlistContent : String )
		{
			service= 'playlist';
			action= 'getStatsFromContent';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'playlistType' );
			valueArr.push( playlistType );
			keyArr.push( 'playlistContent' );
			valueArr.push( playlistContent );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistGetStatsFromContentDelegate( this , config );
		}
	}
}
