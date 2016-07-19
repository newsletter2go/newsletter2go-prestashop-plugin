/**
 * 2007-2016 PrestaShop
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
 *  @copyright 2007-2016 PrestaShop SA
 *  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

$(document).ready(function () {
    $('#nl2goGenerateButton').on('click', function () {
        $('#codeLoader').css('display', 'block');
        $('#code').css('display', 'none');
        $.ajax({
            url: 'index.php',
            cache: false,
            type: 'POST',
            data: {
                'token': token,
                'ajax': 1,
                'tab': 'Newsletter2GoTab',
                'action': 'generateNewApiKey'
            },
            success: function (response) {
                $('#code').attr('value', response);
                $('#apikey').attr('value', response);
                $('#codeLoader').css('display', 'none');
                $('#code').css('display', 'block');
            }
        });
    });

    $('#nl2goConnectButton').on('click', function () {
        var baseUrl = 'https://ui.newsletter2go.com/integrations/connect/PS/',
            params = {
                version: document.getElementById("version").value,
                apiKey: document.getElementById("apikey").value,
                language: document.getElementById("language").value,
                url: document.getElementById("base_url").value
            };

        window.open(baseUrl + '?' + $.param(params), '_blank');
    });
});