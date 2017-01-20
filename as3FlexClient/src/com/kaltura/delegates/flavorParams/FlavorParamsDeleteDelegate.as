package com.borhan.delegates.flavorParams
{
	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class FlavorParamsDeleteDelegate extends WebDelegateBase
	{
		public function FlavorParamsDeleteDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
