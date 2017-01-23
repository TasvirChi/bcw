package com.borhan.commands.system
{
	import com.borhan.delegates.system.SystemGetUserByEmailDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemGetUserByEmail extends BorhanCall
	{
		public var filterFields : String;
		public function SystemGetUserByEmail( email : String )
		{
			service= 'system';
			action= 'getUserByEmail';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemGetUserByEmailDelegate( this , config );
		}
	}
}
