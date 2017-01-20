package com.borhan.vo
{
	import com.borhan.vo.BorhanConvartableJobData;

	[Bindable]
	public dynamic class BorhanRemoteConvertJobData extends BorhanConvartableJobData
	{
		public var srcFileUrl : String;
		public var destFileUrl : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('srcFileUrl');
			propertyList.push('destFileUrl');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileUrl');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('srcFileUrl');
			arr.push('destFileUrl');
			return arr;
		}

	}
}
