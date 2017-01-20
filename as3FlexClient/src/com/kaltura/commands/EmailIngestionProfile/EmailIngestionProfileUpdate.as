package com.borhan.commands.EmailIngestionProfile
{
	import com.borhan.vo.BorhanEmailIngestionProfile;
	import com.borhan.delegates.EmailIngestionProfile.EmailIngestionProfileUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class EmailIngestionProfileUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileUpdate( id : int,EmailIP : BorhanEmailIngestionProfile )
		{
			service= 'emailingestionprofile';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(EmailIP,'EmailIP');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileUpdateDelegate( this , config );
		}
	}
}
