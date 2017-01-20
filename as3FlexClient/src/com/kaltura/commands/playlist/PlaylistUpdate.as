package com.borhan.commands.playlist
{
	import com.borhan.vo.BorhanPlaylist;
	import com.borhan.delegates.playlist.PlaylistUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class PlaylistUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function PlaylistUpdate( id : String,playlist : BorhanPlaylist,updateStats : Boolean=false )
		{
			service= 'playlist';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(playlist,'playlist');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'updateStats' );
			valueArr.push( updateStats );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new PlaylistUpdateDelegate( this , config );
		}
	}
}
