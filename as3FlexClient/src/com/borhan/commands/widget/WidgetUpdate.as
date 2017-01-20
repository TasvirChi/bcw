package com.borhan.commands.widget
{
	import com.borhan.vo.BorhanWidget;
	import com.borhan.delegates.widget.WidgetUpdateDelegate;
	import com.borhan.net.BorhanCall;

	public class WidgetUpdate extends BorhanCall
	{
		public var filterFields : String;
		public function WidgetUpdate( id : String,widget : BorhanWidget )
		{
			service= 'widget';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = borhanObject2Arrays(widget,'widget');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetUpdateDelegate( this , config );
		}
	}
}
