package com.borhan.delegates.liveStream
{
	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class LiveStreamDeleteDelegate extends WebDelegateBase
	{
		public function LiveStreamDeleteDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
