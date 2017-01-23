package com.borhan.commands.widget
{
	import com.borhan.delegates.widget.WidgetGetDelegate;
	import com.borhan.net.BorhanCall;

	public class WidgetGet extends BorhanCall
	{
		public var filterFields : String;
		public function WidgetGet( id : String )
		{
			service= 'widget';
			action= 'get';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new WidgetGetDelegate( this , config );
		}
	}
}
