package com.borhan.vo
{
	import com.borhan.vo.BorhanBatchJob;

	import com.borhan.vo.BaseFlexVo;
	public dynamic class BorhanBatchJobResponse extends BaseFlexVo
	{
		public var batchJob : BorhanBatchJob;
		public var childBatchJobs : Array = new Array();
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('batchJob');
			propertyList.push('childBatchJobs');
		}
		public function getParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('batchJob');
			arr.push('childBatchJobs');
			return arr;
		}

		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('batchJob');
			arr.push('childBatchJobs');
			return arr;
		}

	}
}
