package com.borhan.delegates.conversionProfile
{
	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class ConversionProfileRemoveFlavorParamsDelegate extends WebDelegateBase
	{
		public function ConversionProfileRemoveFlavorParamsDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return '';
		}

	}
}
