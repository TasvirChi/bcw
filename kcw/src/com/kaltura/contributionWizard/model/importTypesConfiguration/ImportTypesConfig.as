package com.borhan.contributionWizard.model.importTypesConfiguration
{
	import com.borhan.contributionWizard.model.importTypesConfiguration.search.SearchConfig;
	import com.borhan.contributionWizard.model.importTypesConfiguration.tagging.TaggingConfig;
	import com.borhan.contributionWizard.model.importTypesConfiguration.upload.UploadConfig;

	[Bindable]
	public class ImportTypesConfig
	{
		public var search:SearchConfig 		= new SearchConfig();
		public var tagging:TaggingConfig 	= new TaggingConfig();
		public var upload:UploadConfig 	= new UploadConfig();
	}
}