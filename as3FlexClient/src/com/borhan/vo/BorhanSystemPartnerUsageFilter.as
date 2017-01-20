package com.borhan.vo
{
	import com.borhan.vo.BorhanFilter;

	[Bindable]
	public dynamic class BorhanSystemPartnerUsageFilter extends BorhanFilter
	{
		public var fromDate : int = int.MIN_VALUE;
		public var toDate : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('fromDate');
			propertyList.push('toDate');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('fromDate');
			arr.push('toDate');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('fromDate');
			arr.push('toDate');
			return arr;
		}

	}
}
