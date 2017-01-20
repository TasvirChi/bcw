package com.borhan.vo
{
	import com.borhan.vo.BorhanJobData;

	[Bindable]
	public dynamic class BorhanPullJobData extends BorhanJobData
	{
		public var srcFileUrl : String;
		public var destFileLocalPath : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('srcFileUrl');
			propertyList.push('destFileLocalPath');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileLocalPath');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileLocalPath');
			return arr;
		}

	}
}
