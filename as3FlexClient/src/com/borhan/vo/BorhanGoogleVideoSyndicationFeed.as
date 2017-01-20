package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseSyndicationFeed;

	[Bindable]
	public dynamic class BorhanGoogleVideoSyndicationFeed extends BorhanBaseSyndicationFeed
	{
		public var adultContent : String;
		public var familyFriendly : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('adultContent');
			propertyList.push('familyFriendly');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('adultContent');
			arr.push('familyFriendly');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('adultContent');
			return arr;
		}

	}
}
