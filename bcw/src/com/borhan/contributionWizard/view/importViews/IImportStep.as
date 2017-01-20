package com.borhan.contributionWizard.view.importViews
{
	import com.borhan.contributionWizard.view.importViews.browser.NavigationButtonsMode;

	public interface IImportStep
	{
		function goNextStep():void;
		function goPrevStep():void;
		function get navigationButtonsMode():NavigationButtonsMode;
	}
}