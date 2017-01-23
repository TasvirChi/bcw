package com.borhan.vo
{
	import com.borhan.vo.BorhanBaseEntry;

	[Bindable]
	public dynamic class BorhanDocumentEntry extends BorhanBaseEntry
	{
		public var documentType : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('documentType');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('documentType');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

	}
}
