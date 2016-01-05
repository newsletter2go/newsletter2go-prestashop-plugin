{*
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
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($newsletter2go_error)}
    <div class="row">
        <div class="col-lg-9" style="text-align: center; color: red;"><h2>{l s='Error: ' mod='newsletter2go'}{$newsletter2go_error|escape:'htmlall':'UTF-8'}</h2></div>
    </div>
{/if}
{if isset($newsletter2go_success_user)}
    <div class="row">
        <div class="col-lg-9" style="text-align: center; color: #8bc954;"><h2>{$newsletter2go_success_user|escape:'htmlall':'UTF-8'}</h2></div>
    </div>
{/if}
{if isset($newsletter2go_success_integration)}
    <div class="row">
        <div class="col-lg-9" style="text-align: center; color: #8bc954;"><h2>{$newsletter2go_success_integration|escape:'htmlall':'UTF-8'}</h2></div>
    </div>
{/if}
<div class="form-horizontal">
    <div class="panel">
        <div class="panel-heading"><i class="icon-cogs"></i>{l s='Webservice Accounts' mod='newsletter2go'}</div>
        <div class="form-wrapper">
            <div class="form-group">
                <label class="control-label col-lg-3 required" style="text-align: right;">
                    <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                        {l s='Key' mod='newsletter2go'}
                    </span>
                </label>
                <div class="col-lg-9 ">
                    <div class="row">
                        <div class="col-lg-5">
                            <img src="../img/admin/ajax-loader.gif" alt="" id="codeLoader" style="display: none;" />
                            <input type="text" name="key" id="code" value="{$web_services_api_key|escape:'htmlall':'UTF-8'}" readonly="true">
                        </div>
                        <div class="col-lg-2">
                            <button type="button" class="btn btn-default" id="nl2goGenerateButton">
                                {l s='Generate!' mod='newsletter2go'}
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<form action="index.php?controller=Newsletter2GoTab&token={$token|addslashes|escape:'htmlall':'UTF-8'}" method="POST">
    {if !$newsletter2go_api_key}
        <div class="form-horizontal">
            <div class="panel">
                <div class="panel-heading"><i class="icon-cogs"></i>{l s='Enter Newsletter2Go API Key' mod='newsletter2go'}</div>
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3 required" style="text-align: right;">
                            <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                                {l s='API key' mod='newsletter2go'}
                            </span>
                        </label>
                        <div class="col-lg-9">
                            <div class="row">
                                <div class="col-lg-5">
                                    <input type="text" name="apikey" id="apikey" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3 required" style="text-align: right;">
                            <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                                {l s='Language' mod='newsletter2go'}
                            </span>
                        </label>
                        <div class="col-lg-3">
                            <div class="row">
                                <div class="col-lg-3">
                                    <select name="language" value="en">
                                        <option value="en">{l s='English' mod='newsletter2go'}</option>
                                        <option value="de">{l s='Deutsch' mod='newsletter2go'}</option>
                                        <option value="fr">{l s='Franch' mod='newsletter2go'}</option>
                                        <option value="es">{l s='Espanol' mod='newsletter2go'}</option>
                                        <option value="nl">{l s='Dutch' mod='newsletter2go'}</option>
                                        <option value="it">{l s='Italian' mod='newsletter2go'}</option>
                                        <option value="pl">{l s='Polish' mod='newsletter2go'}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" class="btn btn-default pull-right" name="submitEnterKey"><i class="process-icon-save"></i> Save</button>
                </div>
            </div>
        </div>

        <div class="form-horizontal">
            <div class="panel">
                <div class="panel-heading"><i class="icon-cogs"></i>{l s='Create New Newsletter2Go Account' mod='newsletter2go'}</div>
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3 required" style="text-align: right;">
                            <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                                {l s='E-mail address' mod='newsletter2go'}
                            </span>
                        </label>
                        <div class="col-lg-9 ">
                            <div class="row">
                                <div class="col-lg-5">
                                    <input type="text" name="email" id="email" value="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3 required" style="text-align: right;">
                            <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                                {l s='Language' mod='newsletter2go'}
                            </span>
                        </label>
                        <div class="col-lg-3">
                            <div class="row">
                                <div class="col-lg-3">
                                    <select name="language" value="en">
                                        <option value="en">{l s='English' mod='newsletter2go'}</option>
                                        <option value="de">{l s='Deutsch' mod='newsletter2go'}</option>
                                        <option value="fr">{l s='Franch' mod='newsletter2go'}</option>
                                        <option value="es">{l s='Espanol' mod='newsletter2go'}</option>
                                        <option value="nl">{l s='Dutch' mod='newsletter2go'}</option>
                                        <option value="it">{l s='Italian' mod='newsletter2go'}</option>
                                        <option value="pl">{l s='Polish' mod='newsletter2go'}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <button type="submit" class="btn btn-default pull-right" name="submitCreateAccount"><i class="process-icon-save"></i> Save</button>
                </div>
            </div>

        </div>
    {else}
        <div class="form-horizontal">
            <div class="panel">
                <div class="panel-heading"><i class="icon-cogs"></i>{l s='Newsletter2Go API Key' mod='newsletter2go'}</div>
                <div class="form-wrapper">
                    <div class="form-group">
                        <label class="control-label col-lg-3 required" style="text-align: right;">
                            <span class="label-tooltip" data-toggle="tooltip" data-html="true" title="" data-original-title="">
                                {l s='API key' mod='newsletter2go'}
                            </span>
                        </label>
                        <div class="col-lg-9 ">
                            <div class="row">
                                <div class="col-lg-5">
                                    <input type="text" name="apikey" id="apikey" value="{$newsletter2go_api_key|escape:'htmlall':'UTF-8'}" readonly="true">
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-default" id="nl2goRemoveButton" name="submitRemoveKey">
                                        {l s='Remove API Key' mod='newsletter2go'}
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}
</form>