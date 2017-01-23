package com.borhan.vo
{
	import com.borhan.vo.BorhanBatchJobFilter;

	[Bindable]
	public dynamic class BorhanBatchJobFilterExt extends BorhanBatchJobFilter
	{
		public var jobTypeAndSubTypeIn : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('jobTypeAndSubTypeIn');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('jobTypeAndSubTypeIn');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('jobTypeAndSubTypeIn');
			return arr;
		}

	}
}
