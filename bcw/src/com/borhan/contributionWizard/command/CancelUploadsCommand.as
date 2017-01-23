/*
This file is part of the Borhan Collaborative Media Suite which allows users
to do with audio, video, and animation what Wiki platfroms allow them to do with
text.

Copyright (C) 2006-2008  Borhan Inc.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

@ignore
*/
package com.borhan.contributionWizard.command
{
	import com.adobe_cw.adobe.cairngorm.commands.ICommand;
	import com.adobe_cw.adobe.cairngorm.control.CairngormEvent;
	import com.borhan.contributionWizard.events.ReportErrorEvent;
	import com.borhan.contributionWizard.model.WizardModelLocator;
	import com.borhan.contributionWizard.vo.ErrorVO;
	import com.borhan.vo.importees.ImportFileVO;
	import com.borhan.vo.importees.UploadStatusTypes;
	
	import de.polygonal.ds.ArrayedQueue;
	
	import flash.utils.getTimer;

	public final class CancelUploadsCommand implements ICommand
	{
		private var _model:WizardModelLocator = WizardModelLocator.getInstance();
		public function execute(event:CairngormEvent):void
		{
			var queue:ArrayedQueue = _model.importData.uploadQueue;
			var importUrlVo:ImportFileVO;
			while(importUrlVo =   queue.dequeue() as ImportFileVO)
			{
				//importUrlVo.uploadStatus = UploadStatusTypes.UPLOAD_FAILED;
				importUrlVo.uploadStatus = UploadStatusTypes.UPLOAD_CANCELED;
			}
			//do this operation last because it will trigger the next upload immediately if any exists
			cancelCurrentUpload();
		}

		private function cancelCurrentUpload():void
		{
			var currentImportFileVo:ImportFileVO = _model.importData.importCart.currentlyProcessedImportVo as ImportFileVO;
			var startTime:int = getTimer();
			currentImportFileVo.polledfileReference.cancel();
			var endTime:int = getTimer();
			
			//REPORT TO BORHAN TO TRACE PROBLEMS WITH UPLOAD
			///////////////////////////////////////////////////
			var errorVo : ErrorVO = new ErrorVO();
			errorVo.reportingObj = "CancelUploadsCommand";
			errorVo.errorDescription = "uploadId="+currentImportFileVo.fileName + "&timeToCancel=" + (endTime - startTime).toString();
			var reportErrorEvent : ReportErrorEvent = new ReportErrorEvent(ReportErrorEvent.CANCEL_UPLOAD , errorVo );
			reportErrorEvent.dispatch();
			///////////////////////////////////////////////////
			
			trace(endTime - startTime);
		}

	}
}