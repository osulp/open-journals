{**
 * templates/article/header.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article View -- Header component.
 *}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{$article->getLocalizedTitle()|strip_tags|escape} | {$article->getFirstAuthor(true)|strip_tags|escape} | {$currentJournal->getLocalizedTitle()|strip_tags|escape}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="description" content="{$article->getLocalizedTitle()|strip_tags|escape}" />
	{if $article->getLocalizedSubject()}
		<meta name="keywords" content="{$article->getLocalizedSubject()|escape}" />
	{/if}
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" type="{$displayFavicon.mimeType|escape}" />{/if}

	{include file="article/dublincore.tpl"}
	{include file="article/googlescholar.tpl"}
	{call_hook name="Templates::Article::Header::Metadata"}

	<!--<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/pkp.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/compiled.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/articleView.css" type="text/css" />
	{if $journalRt && $journalRt->getEnabled()}
		<link rel="stylesheet" href="{$baseUrl}/lib/pkp/styles/rtEmbedded.css" type="text/css" />-->
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	<!--{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if}-->

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">{literal}
		// Provide a local fallback if the CDN cannot be reached
		if (typeof google == 'undefined') {
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	<script type="text/javascript">{literal}
		$(function(){
			fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
		});
	{/literal}</script>

	<!-- Compiled scripts -->
	{if $useMinifiedJavaScript}
		<script type="text/javascript" src="{$baseUrl}/js/pkp.min.js"></script>
	{else}
		{include file="common/minifiedScripts.tpl"}
	{/if}

	{$additionalHeadData}
    
    <!-- ResponsiveTheme Template Plugin -->

	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/style.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$baseUrl}/plugins/themes/responsiveTheme/css/main.css" type="text/css" />
	<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="{$baseUrl}/styles/pdfView.css" type="text/css" /> 
	
	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}
	
	{$themeHeadData}
	
	{literal}
    <script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/jquery.min.js"></script>
    <script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/jquery-browser.js"></script>
    <script type="text/javascript">
    //Load the new jQuery locally if it could not be loaded from the CDN
    if (typeof jQuery == 'undefined' || jQuery.fn.jquery != '1.9.1')
    {
        document.write(unescape("%3Cscript src='{/literal}{$baseUrl|escape:"javascript"}{literal}/plugins/themes/responsiveTheme/js/jquery-1.9.1.min.js' type='text/javascript'%3E%3C/script%3E"));
    }
    </script>

    <script type="text/javascript">
    //Ensure the new jQuery doesn't conflict. 
    var jQueryNew = window.jQuery.noConflict(true);
    </script>

    <script type="text/javascript" src="{/literal}{$baseUrl}{literal}/plugins/themes/responsiveTheme/js/bootstrap.min.js"></script>
    {/literal}     

	<!-- ResponsiveTheme -->
	{literal}
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) return;
			js = d.createElement(s); js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=1505643366421471";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script>
		!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');
	</script>
	<script type="text/javascript">
		(function() {
			var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
			po.src = 'https://apis.google.com/js/platform.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
		})();
		//$(function(){
		//	$(".dropdown").hover(      
		//		function() {
		//			$('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
		//			$(this).toggleClass('open');
		//			$('b', this).toggleClass("caret caret-up");                
		//		},
		//		function() {
		//			$('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
		//			$(this).toggleClass('open');
		//			$('b', this).toggleClass("caret caret-up");
		//		}
		//	);
		//});
	</script>
	
	{/literal}
	<!-- ResponsiveTheme end -->
	

    
</head>
<body>
<div id="fb-root"></div>
<div id="body">
	<div class="header-main">
		
		<div id="header">
		    <div id="headerTitle">
			<h1>
			{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
			    <img class="img-logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogoAltText != ''}alt="{$displayPageHeaderLogoAltText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
			{/if}
			{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
			    <img class="img-title" src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" class="img-responsive" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
			{elseif $displayPageHeaderTitle}
				{$displayPageHeaderTitle}
			{elseif $alternatePageHeader}
				{$alternatePageHeader}
			{elseif $siteTitle}
				{$siteTitle}
			{else}
				{$applicationName}
			{/if}
			</h1>
		    </div>
		</div>
		
		{include file="common/navbar.tpl"}
    </div>
	
	
	<div id="container">
		<div class="container">
			<div class="row">
				{assign var="mainspan" value="12"}
				{* Calculate how many spans for body content *}
				{if $leftSidebarCode && $rightSidebarCode}
					{assign var="mainspan" value="6"}
				{elseif $leftSidebarCode || $rightSidebarCode}
					{assign var="mainspan" value="9"}
				{/if}
				
				{if $leftSidebarCode}
					<div id="leftSidebar" class="col-xs-12 col-sm-3 col-md-3 col-lg-3 well-small">
						<ul class="nav nav-list">
							{$leftSidebarCode}
						</ul>
					</div>
				{/if}
			
				<div id="main" class="col-lg-{$mainspan}  col-sm-{$mainspan} col-md-{$mainspan} content-area">
					{include file="common/articleBreadcrumbs.tpl"}
					<h2>{$pageTitleTranslated}</h2>
					{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
					{if $pageSubtitleTranslated}
						<h3>{$pageSubtitleTranslated}</h3>
					{/if}
