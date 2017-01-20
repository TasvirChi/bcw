package com.borhan.commands.EmailIngestionProfile
{
	import com.borhan.delegates.EmailIngestionProfile.EmailIngestionProfileGetByEmailAddressDelegate;
	import com.borhan.net.BorhanCall;

	public class EmailIngestionProfileGetByEmailAddress extends BorhanCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileGetByEmailAddress( emailAddress : String )
		{
			service= 'emailingestionprofile';
			action= 'getByEmailAddress';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'emailAddress' );
			valueArr.push( emailAddress );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileGetByEmailAddressDelegate( this , config );
		}
	}
}
