package com.borhan.commands.metadataBatch
{
	import com.borhan.vo.BorhanExclusiveLockKey;
	import com.borhan.delegates.metadataBatch.MetadataBatchUpdateExclusiveConvertJobSubTypeDelegate;
	import com.borhan.net.BorhanCall;

	public class MetadataBatchUpdateExclusiveConvertJobSubType extends BorhanCall
	{
		public var filterFields : String;
		public function MetadataBatchUpdateExclusiveConvertJobSubType( id : int,lockKey : BorhanExclusiveLockKey,subType : int )
		{
			service= 'metadata_metadatabatch';
			action= 'updateExclusiveConvertJobSubType';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'subType' );
			valueArr.push( subType );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new MetadataBatchUpdateExclusiveConvertJobSubTypeDelegate( this , config );
		}
	}
}
