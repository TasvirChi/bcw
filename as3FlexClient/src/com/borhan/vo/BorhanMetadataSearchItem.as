package com.borhan.vo
{
	import com.borhan.vo.BorhanSearchOperator;

	[Bindable]
	public dynamic class BorhanMetadataSearchItem extends BorhanSearchOperator
	{
		public var metadataProfileId : int = int.MIN_VALUE;
		override protected function setupPropertyList():void
		{
			super.setupPropertyList();
			propertyList.push('metadataProfileId');
		}
		override public function getParamKeys():Array
		{
			var arr : Array;
			arr = super.getParamKeys();
			arr.push('metadataProfileId');
			return arr;
		}

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('metadataProfileId');
			return arr;
		}

	}
}
