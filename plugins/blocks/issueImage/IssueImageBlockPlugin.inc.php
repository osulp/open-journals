<?php

/**
 * @file IssueImageBlockPlugin.inc.php
 *
 * DevelopedBy Copyright (c) 2003-2010 John Willinsky
 * modifications by JQ Johnson
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class IssueImageBlockPlugin
 * @ingroup plugins_blocks_issueImage
 *
 * @brief Class for "issue image" block plugin
 */

// $Id$


import('lib.pkp.classes.plugins.BlockPlugin');

class IssueImageBlockPlugin extends BlockPlugin {
	/**
	 * Determine whether the plugin is enabled. 
	 * Overrides parent so that
	 * the plugin will be displayed during install.
	 */
	function getEnabled() {
		if (!Config::getVar('general', 'installed')) return true;
		return parent::getEnabled();
	}

	/**
	 * Install default settings on system install.
	 * @return string
	 */
	function getInstallSitePluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Install default settings on journal creation.
	 * @return string
	 */
	function getContextSpecificPluginSettingsFile() {
		return $this->getPluginPath() . '/settings.xml';
	}

	/**
	 * Get the block context. Overrides parent so that the plugin will be
	 * displayed during install.
	 * @return int
	 */
	function getBlockContext() {
		if (!Config::getVar('general', 'installed')) return BLOCK_CONTEXT_RIGHT_SIDEBAR;
		return parent::getBlockContext();
	}

	/**
	 * Determine the plugin sequence. Overrides parent so that
	 * the plugin will be displayed during install.
	 */
	function getSeq() {
		if (!Config::getVar('general', 'installed')) return 1;
		return parent::getSeq();
	}

	/**
	 * Get the display name of this plugin.
	 * @return String
	 */
	function getDisplayName() {
		return Locale::translate('plugins.block.issueImage.displayName');
	}

	/**
	 * Get a description of the plugin.
	 */
	function getDescription() {
		return Locale::translate('plugins.block.issueImage.description');
	}

	/**
	 * Get the supported contexts (e.g. BLOCK_CONTEXT_...) for this block.
	 * @return array
	 */
	function getSupportedContexts() {
		return array(BLOCK_CONTEXT_LEFT_SIDEBAR,BLOCK_CONTEXT_RIGHT_SIDEBAR);
	}

}

?>
