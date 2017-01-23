package com.borhan.vo
{
	import com.borhan.vo.BaseFlexVo;
	[Bindable]
	public dynamic class BorhanAdminUser extends BaseFlexVo
	{
		public var password : String;
		public var email : String;
		public var screenName : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('password');
			propertyList.push('email');
			propertyList.push('screenName');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('password');
			arr.push('email');
			arr.push('screenName');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('screenName');
			return arr;
		}

	}
}
