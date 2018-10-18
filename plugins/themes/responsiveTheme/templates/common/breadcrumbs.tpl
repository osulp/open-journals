{**

 * breadcrumbs.tpl

 *

 * Copyright (c) 2013-2014 Simon Fraser University Library

 * Copyright (c) 2000-2014 John Willinsky

 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.

 *

 * Breadcrumbs

 *

 *}
<div id="breadcrumb">
	<a href="{url context=$homeContext page="index"}">{translate key="navigation.home"}</a> >


	{if $currentUrl|strpos:"article/view" !== false}
		   {if $issue}<a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" target="_parent">{$issue->getIssueIdentification(false,true)|escape}</a> >{/if}

	    	<a href="{url page="article" op="view" path=$articleId|to_array:$galleyId}" class="current" target="_parent">{$article->getFirstAuthor(true)|escape}</a>
	{else}
		{foreach from=$pageHierarchy item=hierarchyLink}

	    <a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a> >

	    {/foreach}

	    {if $requiresFormRequest}{else}<a href="{$currentUrl|escape}" class="current">{/if}{$pageCrumbTitleTranslated}{if $requiresFormRequest}{else}</a>{/if} 
	{/if}
    
    
</div>


