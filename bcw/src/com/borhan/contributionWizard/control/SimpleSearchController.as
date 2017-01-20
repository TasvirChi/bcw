package com.borhan.contributionWizard.control
{
	import com.borhan.contributionWizard.command.GetMediaInfoCommand;
	import com.borhan.contributionWizard.command.LoginToProviderCommand;
	import com.borhan.contributionWizard.command.ModerateSearchTermsCommand;
	import com.borhan.contributionWizard.command.SearchMediaCommand;
	import com.borhan.contributionWizard.command.ToggleAuthMethodCommand;
	import com.borhan.contributionWizard.events.AuthMethodEvent;
	import com.borhan.contributionWizard.events.LoginEvent;
	import com.borhan.contributionWizard.events.MediaInfoEvent;
	import com.borhan.contributionWizard.events.SearchMediaEvent;

	public class SimpleSearchController extends BaseSearchController
	{
		protected override function initializeCommands():void
		{
			super.initializeCommands()

			addCommand( AuthMethodEvent.TOGGLE_AUTH_METHOD,				ToggleAuthMethodCommand );
			addCommand( LoginEvent.PROVIDER_LOGIN, 						LoginToProviderCommand );
			addCommand( MediaInfoEvent.GET_MEDIA_INFO, 					GetMediaInfoCommand );
			addCommand( SearchMediaEvent.SEARCH_MEDIA, 					SearchMediaCommand );
		}
	}
}