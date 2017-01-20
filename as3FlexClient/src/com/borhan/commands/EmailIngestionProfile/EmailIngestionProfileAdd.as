package com.borhan.commands.EmailIngestionProfile
{
	import com.borhan.vo.BorhanEmailIngestionProfile;
	import com.borhan.delegates.EmailIngestionProfile.EmailIngestionProfileAddDelegate;
	import com.borhan.net.BorhanCall;

	public class EmailIngestionProfileAdd extends BorhanCall
	{
		public var filterFields : String;
		public function EmailIngestionProfileAdd( EmailIP : BorhanEmailIngestionProfile )
		{
			service= 'emailingestionprofile';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = borhanObject2Arrays(EmailIP,'EmailIP');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new EmailIngestionProfileAddDelegate( this , config );
		}
	}
}
