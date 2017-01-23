package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanEntryExtraDataResult extends BaseFlexVo
	{
		public var isSiteRestricted : Boolean;
		public var isCountryRestricted : Boolean;
		public var isSessionRestricted : Boolean;
		public var previewLength : int = int.MIN_VALUE;
		public var isScheduledNow : Boolean;
		public var isAdmin : Boolean;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('isSiteRestricted');
			propertyList.push('isCountryRestricted');
			propertyList.push('isSessionRestricted');
			propertyList.push('previewLength');
			propertyList.push('isScheduledNow');
			propertyList.push('isAdmin');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('isSiteRestricted');
			arr.push('isCountryRestricted');
			arr.push('isSessionRestricted');
			arr.push('previewLength');
			arr.push('isScheduledNow');
			arr.push('isAdmin');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('isSiteRestricted');
			arr.push('isCountryRestricted');
			arr.push('isSessionRestricted');
			arr.push('previewLength');
			arr.push('isScheduledNow');
			arr.push('isAdmin');
			return arr;
		}

	}
}
