package com.borhan.commands.system
{
	import com.borhan.delegates.system.SystemLoginDelegate;
	import com.borhan.net.BorhanCall;

	public class SystemLogin extends BorhanCall
	{
		public var filterFields : String;
		public function SystemLogin( email : String,password : String )
		{
			service= 'system';
			action= 'login';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'email' );
			valueArr.push( email );
			keyArr.push( 'password' );
			valueArr.push( password );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new SystemLoginDelegate( this , config );
		}
	}
}
