package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseEntryFilter;

	[Bindable]
	public dynamic class BorhanDocumentEntryFilter extends BorhanBaseEntryFilter
	{
		public var documentTypeEqual : int = int.MIN_VALUE;
		public var documentTypeIn : String;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('documentTypeEqual');
			propertyList.push('documentTypeIn');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('documentTypeEqual');
			arr.push('documentTypeIn');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('documentTypeEqual');
			arr.push('documentTypeIn');
			return arr;
		}

	}
}
