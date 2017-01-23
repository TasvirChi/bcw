package com.borhan.commands.EmailIngestionProfile
{
	import com.borhan.delegates.EmailIngestionProfile.EmailIngestionProfileDeleteDelegate;
	import com.borhan.net.BorhanCall;

	public class EmailIngestionProfileDelete extends BorhanCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileDelete( id : int )
		{
			service= 'emailingestionprofile';
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
			delegate = new EmailIngestionProfileDeleteDelegate( this , config );
		}
	}
}
