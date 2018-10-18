{**
 * templates/about/editorialTeamBoard.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeam"}
{include file="common/header.tpl"}
{/strip}

{call_hook name="Templates::About::EditorialTeam::Information"}

<!-- Modal -->
<div id="modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">
				
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>


<div id="groups">
  {foreach from=$groups item=group}
    <div class="group">
	    <h4>{$group->getLocalizedTitle()}</h4>
	    {assign var=groupId value=$group->getId()}
	    {assign var=members value=$teamInfo[$groupId]}
    
	    <ol class="editorialTeam">
		    {foreach from=$members item=member}
			    {assign var=user value=$member->getUser()}
			    <div class="member"><li><a data-toggle="modal" data-target="#modal" data-remote="{url op="editorialTeamBio" path=$user->getId()}">{$user->getFullName()|escape}</a>{if $user->getLocalizedAffiliation()}, {$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li></div>
		    {/foreach}{* $members *}
	    </ol>
    </div>
  {/foreach}{* $groups *}
</div>

{include file="common/footer.tpl"}

