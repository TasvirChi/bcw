package com.borhan.delegates.liveStream
{
	import com.borhan.core.KClassFactory;

	import flash.utils.getDefinitionByName;
	import com.borhan.config.BorhanConfig;
	import com.borhan.net.BorhanCall;
	import com.borhan.delegates.WebDelegateBase;
	public class LiveStreamUpdateOfflineThumbnailJpegDelegate extends WebDelegateBase
	{
		public function LiveStreamUpdateOfflineThumbnailJpegDelegate(call:BorhanCall, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var cls : Class = getDefinitionByName('com.borhan.vo.'+ result.result.objectType) as Class;
			var obj : * = (new KClassFactory( cls )).newInstanceFromXML( result.result );
			return obj;
		}

	}
}
