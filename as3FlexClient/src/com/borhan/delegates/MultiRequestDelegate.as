package com.borhan.delegates
{
	import com.borhan.commands.MultiRequest;
	import com.borhan.config.BorhanConfig;
	import com.borhan.errors.BorhanError;

	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;

	public class MultiRequestDelegate extends WebDelegateBase
	{
		public function MultiRequestDelegate(call:MultiRequest, config:BorhanConfig)
		{
			super(call, config);
		}

		override public function parse( result : XML ) : *
		{
			var resArr : Array = new Array();
			for ( var i:int=0; i<(call as MultiRequest).actions.length; i++ )
			{
				var callClassName : String = getQualifiedClassName( (call as MultiRequest).actions[i] );
				var commandName : String = callClassName.split("::")[1];
				var packageArr : Array =  (callClassName.split("::")[0]).split(".");
				var importFrom : String = packageArr[packageArr.length-1];

				var clsName : String = "com.borhan.delegates."+importFrom+"."+ commandName +"Delegate"; //'com.borhan.delegates.session.SessionStartDelegate'
				var cls : Class = getDefinitionByName( clsName ) as Class;//(') as Class;

				var myInst : Object = new cls(null , null);

				//build the result as a regular result
				var xml : String = "<result><result>";
				xml += result.result.item[i].children().toString();
				xml +="</result></result>";
				var res : XML = new XML(xml);
				try {
					var obj : Object = (myInst as WebDelegateBase).parse( res );
					resArr.push( obj );
				} catch (e:Error) {
					var kErr : BorhanError = new BorhanError();
					kErr.errorCode = String(e.errorID);
					kErr.errorMsg = e.message;
					resArr.push( kErr );
				}
			}

			return resArr;
		}
	}
}