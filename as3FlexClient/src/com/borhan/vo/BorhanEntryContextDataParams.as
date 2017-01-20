package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanEntryContextDataParams extends BaseFlexVo
	{
		public var referrer : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('referrer');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('referrer');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('referrer');
			return arr;
		}

	}
}
