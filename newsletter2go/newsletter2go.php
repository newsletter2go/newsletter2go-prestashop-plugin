<?php
/**
 * 2007-2015 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2015 PrestaShop SA
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */
class Newsletter2Go extends Module
{
    public function __construct()
    {
        $this->module_key = '0372c81a8fe76ebddb8ec637278afe98';
        $this->name = 'newsletter2go';
        $this->tab = 'advertising_marketing';
        $this->version = '3.0.01';
        $this->author = 'Newsletter2Go';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
        $this->bootstrap = true;
        parent::__construct();
        $this->displayName = $this->l('Newsletter2Go email marketing');
        $this->description = $this->l('Synchronizes your newsletter subscribers and shop items with Newsletter2Go');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
        if (!Configuration::get('NEWSLETTER2GO_NAME')) {
            $this->warning = $this->l('No name provided');
        }
    }
    public function install()
    {
        // Install Tabs
        $parent_tab = new Tab();
        // Need a foreach for the language
        $parent_tab->name[(int)Configuration::get('PS_LANG_DEFAULT')] = $this->l('Newsletter2Go');
        $parent_tab->class_name = 'Newsletter2GoTab';
        $parent_tab->id_parent = 0; // Home tab
        $parent_tab->module = $this->name;
        $parent_tab->add();
        return parent::install() && $this->registerHook('backOfficeHeader');
    }
    public function uninstall()
    {
        $tab = new Tab((int)Tab::getIdFromClassName('Newsletter2GoTab'));
        $tab->delete();
        return parent::uninstall();
    }
    public function hookBackOfficeHeader()
    {//note the case of hook name
        $this->context->controller->addJS($this->_path . 'views/js/nl2go_script.js');
        $this->context->controller->addCSS($this->_path . 'views/css/menuTabIcon.css');
    }
}