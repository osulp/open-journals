{**
 * templates/common/navbar1.tpl
 *
 * Copyright (c) 2015 Gennhy Riveron
 * Copyright (c) 2005 Carlos Cesar Caballero Diaz
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
 
 <nav id="mainmenu" class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <!--a class="navbar-brand" href="{url page="index"}">{if $siteTitle}
        {$siteTitle}
    {else}
        {$applicationName}
    {/if}</a-->
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
	  <li id="homeMenu" {if $requestedPage == 'index' ||  $requestedPage == ''}class="active"{/if}><a href="{url page="index"}"><i class="fa fa-home" aria-hidden="true"></i> {translate key="navigation.home"}</a></li>
	  <li id="aboutMenu" {if $requestedPage == 'about'}class="active"{/if}><a href="{url page="about"}"><i class="fa fa-users" aria-hidden="true"></i> {translate key="navigation.about"}</a></li>
	  <li id="aboutSubmissionsMenu" {if $requestedPage == 'about' && $requestedOp == 'submissions'}class="active"{/if}><a href="{url page="login" op=""}"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> {translate key="navigation.submissions"}</a></li>
	</ul>
    
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown user-dropdown {if $requestedPage == 'search'}active{/if}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-search"></i></a>
            <ul class="dropdown-menu">
                <li role="presentation">
                    <form method="post" id="searchForm" action="{url page="search"}" class="navbar-form" role="search">
                        <div class="form-group">
                            <input type="text" id="query" name="query" value="{$query|escape}" class="form-control" placeholder="{translate key="common.search"}">
                        </div>
                    </form>                    
                </li>
                <li role="presentation" class="divider"></li>
                {if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
                <li role="presentation" {if $requestedPage == 'search'}class="active"{/if}><a href="{url page="search"}" title="{translate key="plugins.themes.responsiveTheme.advanceSearch"}">{translate key="plugins.themes.responsiveTheme.advanceSearch"}</a></li>
                {/if}
            </ul>
        </li>
        <li class="dropdown user-dropdown {if ($requestedPage == 'index' || $requestedPage == 'user' || $requestedPage == 'login') && ($requestedOp == 'user' || $requestedOp == 'profile' || $requestedOp == 'signOut' || $requestedOp == 'index' || $requestedOp == 'register' || $requestedOp == 'lostPassword')}active{/if}">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> {if $isUserLoggedIn}{$loggedInUsername}{else}{translate key="user.login"}{/if} <i class="fa fa-caret-down"></i></a>
            {if $isUserLoggedIn}
            <ul class="dropdown-menu">
				<!--<li id="userHomeMenu"><a href="{url journal="index" page="index" op="index"}"><i class="fa fa-home"></i> Publisher Home</a></li> -->
                <li role="presentation" {if !$currentJournal && $requestedPage == 'user' && $requestedOp != 'profile'}class="active"{/if}><a href="{url journal="index" page="user"}"><i class="fa fa-dashboard"></i> {translate key="navigation.userHome"}</a></li>
                <li role="presentation" {if $requestedPage == 'user' && $requestedOp == 'profile'}class="active"{/if}><a href="{url page="user" op="profile"}"><i class="fa fa-user"></i> {translate key="plugins.themes.responsiveTheme.myProfile"}</a></li>
                <li role="presentation" {if $requestedPage == 'login' && $requestedOp == 'signOut'}class="active"{/if}><a href="{url page="login" op="signOut"}"><i class="fa fa-sign-out"></i> {translate key="plugins.themes.responsiveTheme.logout"}</a></li>
            </ul>
            {else}
            <ul class="dropdown-menu">
				<li id="userHomeMenu" {if !$currentJournal && $requestedPage == 'index'}class="active"{/if}><a href="{url journal="index" page="index" op="index"}"><i class="fa fa-home"></i> {translate key="plugins.themes.responsiveTheme.publisherHome"}</a></li> 
                <li role="presentation" id="login" {if $requestedPage == 'login'}{if $requestedOp == 'lostPassword' or $requestedOp == 'signOut' }{else}class="active"{/if}{/if}><a href="{url page="login"}"><i class="fa fa-user"></i> {translate key="navigation.login"}</a></li>
                <li role="presentation" id="register" {if $requestedPage == 'user' && $requestedOp == 'register'}class="active"{/if}><a href="{url page="user" op="register"}"><i class="fa fa-key"></i> {translate key="navigation.register"}</a></li>
                <li role="presentation" {if $requestedPage == 'login' && $requestedOp == 'lostPassword'}class="active"{/if}><a href="{url page="login" op="lostPassword"}"><i class="fa fa-lock"></i> {translate key="user.login.forgotPassword"}</a></li>
            </ul>
            {/if}
        </li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

