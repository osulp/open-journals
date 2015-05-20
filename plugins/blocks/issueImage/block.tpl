{**
 * block.tpl
 *
 * Copyright (c) 2003-2010 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Sidebar menu -- "Issue Image" block.
 *
 * $Id$
 *}
<div class="block" id="sidebarIssueImage">
{literal}
<script type="text/javascript">
  window.onload = function(){
  if (document.getElementById('issueCoverImage') || document.getElementById('homepageImage'))
	document.getElementById('sidebarIssueImage').style.display = 'none';
  }
</script>
{/literal}
	{if $issue && $publicFilesDir}
		<img src="{$publicFilesDir}/{$issue->getLocalizedFileName('fileName')|escape}"
  			alt="{if $issue->getLocalizedCoverPageAltText() != ''}{$issue->getLocalizedCoverPageAltText()|escape}{else}{translate key="issue.coverPage.altText"}{/if}"
			style="width:100%;max-width:140px;" />
		<br />
		{if $issue->getLocalizedCoverPageAltText() != ''} {$issue->getLocalizedCoverPageAltText()|escape}
  		{else} {translate key="issue.coverPage.altText"} 
  		{/if}

	{elseif $currentJournal && $pageTitleTranslated != $siteTitle}
        {assign var="homepageImage" value=$currentJournal->getLocalizedSetting('homepageImage')}
		{assign var="homepageImageAltText" value=$currentJournal->getLocalizedSetting('homepageImageAltText')}
		{if $homepageImage}
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape "url"}" 
				{if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if}
				style="width:100%;max-width:140px;" />
			<br />
			{if $homepageImageAltText != ''}{$homepageImageAltText|escape}{else}{translate key="common.journalHomepageImage.altText"}{/if}
		{/if}
	{/if}
</div>	
