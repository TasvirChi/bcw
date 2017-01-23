package com.borhan.commands.EmailIngestionProfile
{
	import com.borhan.delegates.EmailIngestionProfile.EmailIngestionProfileGetDelegate;
	import com.borhan.net.BorhanCall;

	public class EmailIngestionProfileGet extends BorhanCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileGet( id : int )
		{
			service= 'emailingestionprofile';
			action= 'get';

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
			delegate = new EmailIngestionProfileGetDelegate( this , config );
		}
	}
}
