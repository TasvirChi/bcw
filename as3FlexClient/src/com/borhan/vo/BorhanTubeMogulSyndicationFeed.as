package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseSyndicationFeed;

	[Bindable]
	public dynamic class BorhanTubeMogulSyndicationFeed extends BorhanBaseSyndicationFeed
	{
		public var category : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('category');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('category');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
