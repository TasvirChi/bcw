package com.borhan.delegates.systemUser
{
	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class SystemUserSetNewPasswordDelegate extends WebDelegateBase
	{
		public function SystemUserSetNewPasswordDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
