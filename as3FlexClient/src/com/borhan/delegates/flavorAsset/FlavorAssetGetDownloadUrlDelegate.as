package com.borhan.delegates.flavorAsset
{
	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class FlavorAssetGetDownloadUrlDelegate extends WebDelegateBase
	{
		public function FlavorAssetGetDownloadUrlDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			return result.result.toString();
		}

	}
}
