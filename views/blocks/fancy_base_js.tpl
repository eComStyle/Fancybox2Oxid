[{*
/*    Please retain this copyright header in all versions of the software
 *
 *    Copyright (C) Josef A. Puckl | eComStyle.de
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see {http://www.gnu.org/licenses/}.
 */
*}]
[{$smarty.block.parent}]
[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]
[{assign var="ecs_fancy_jslink" value=$oConfig->getConfigParam('ecs_fancy_jslink')}]
[{assign var="fancyclasses" value=$oConfig->getConfigParam('ecs_fancy_classes')}]
[{foreach from=$fancyclasses item=fancyclass}]
    [{if $oView->getClassName() eq $fancyclass}]
        [{oxscript include=$ecs_fancy_jslink priority=10 }]
        [{capture assign=fancyload}]
            $(document).ready(function() {
                $("a[href$='.jpg'],a[href$='.jpeg'],a[href$='.png'],a[href$='.gif']").attr('data-fancybox', 'articlemain').addClass('fancybox').fancybox();
                [{if $oConfig->getConfigParam('ecs_fancy_ful') }]
                    $('[data-fancybox="articlemain"]').fancybox({fullScreen : {autoStart : true}});
                [{/if}]
                $.fancybox.defaults.hash = false;
            });
        [{/capture}]
        [{oxscript add=$fancyload}]
    [{/if}]
[{/foreach}]