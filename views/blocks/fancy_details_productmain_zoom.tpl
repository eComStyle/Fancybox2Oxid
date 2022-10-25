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
[{*oxscript add="$( document ).ready( function() { if( !window.isMobileDevice() ) Flow.initDetailsEvents(); });"*}]
[{oxscript add="$( document ).ready( function() { Flow.initDetailsEvents(); });"}]
[{* Wird ausgeführt, wenn es sich um einen AJAX-Request handelt *}]
[{if $blWorkaroundInclude}]
    [{oxscript add="$( document ).ready( function() { Flow.initEvents();});"}]
[{/if}]
[{* ############################################################################################################### *}]
[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]
[{assign var="ArticlesTitle" value="`$oPictureProduct->oxarticles__oxtitle->value` `$oPictureProduct->oxarticles__oxvarselect->value`"}]
<div class="fancymasterpic picture" id="FancyPicsContainer">
    [{if $oView->showZoomPics()}]
        [{if $oConfig->getConfigParam('sAltImageUrl') || $oConfig->getConfigParam('sSSLAltImageUrl')}]
            [{assign var="aPictureInfo" value=$oPictureProduct->getMasterZoomPictureUrl(1)|@getimagesize}]
        [{else}]
            [{assign var="sPictureName" value=$oPictureProduct->getPictureFieldValue("oxpic", $iPicNr)}]
            [{assign var="aPictureInfo" value=$oConfig->getMasterPicturePath("product/`$iPicNr`/`$sPictureName`")|@getimagesize}]
        [{/if}]
        [{assign var="aNoZoomPictureInfo" value=$oView->getActPicture()|@getimagesize}]
        <a href="[{$oPictureProduct->getMasterZoomPictureUrl(1)}]" id="fancyid_1"[{if $aPictureInfo}] data-width="[{$aPictureInfo.0}]" data-height="[{$aPictureInfo.1}]"[{/if}] data-caption="[{$ArticlesTitle|strip_tags}]" data-fancybox="articlemain" class="fancybox">
            <img src="[{$oView->getActPicture()}]" alt="[{$ArticlesTitle|strip_tags}]" class="img-responsive center-block"[{if $aNoZoomPictureInfo}] width="[{$aNoZoomPictureInfo.0}]" height="[{$aNoZoomPictureInfo.1}]"[{/if}] itemprop="image">
        </a>
    [{else}]
        <img src="[{$oView->getActPicture()}]" alt="[{$ArticlesTitle|strip_tags}]" class="img-responsive center-block" itemprop="image">
    [{/if}]
</div>
[{if $oView->showZoomPics()}]
    <p class="text-center text-muted small hidden-print"><i class="fa fa-search-plus" aria-hidden="true"></i>&nbsp;[{ oxmultilang ident="ECSKLICKIT" }]</p>
[{/if}]
[{*********************Tumbnails*********************************** *}]
[{if $oView->morePics()}]
    [{assign var="pictureCount"  value=$oView->getIcons()|@count}]
    [{if $pictureCount == "2"}]     [{assign var="col" value="5"}]
    [{elseif $pictureCount eq "3"}] [{assign var="col" value="4"}]
    [{elseif $pictureCount eq "4"}] [{assign var="col" value="3"}]
    [{elseif $pictureCount eq "5"}] [{assign var="col" value="2"}]
    [{elseif $pictureCount eq "6"}] [{assign var="col" value="1"}]
    [{else}]                        [{assign var="col" value="0"}]
    [{/if}]
    <hr class="hidden-print">
    <div class="hidden-print clearfix clear fancymorepics">
        [{foreach from=$oView->getIcons() key=iPicNr item=oArtIcon name=sMorePics}]
            [{if $iPicNr == 8}]<div class="clearfix"></div>[{/if}]
            [{if $iPicNr !=1}]
                <div class="[{if $iPicNr ==2 }]col-xs-offset-[{$col}] [{/if}]col-lg-2 col-md-2] col-sm-2 col-xs-2 float-left" style="padding:3px">
                    <a href="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]" title="[{$ArticlesTitle|strip_tags}]" data-caption="[{$ArticlesTitle|strip_tags}]" data-fancybox="articlemain" class="fancybox">
                        <img src="[{$oPictureProduct->getIconUrl($iPicNr)}]" alt="[{$ArticlesTitle|strip_tags}]" class="img-thumbnail center-block">
                    </a>
                </div>
            [{/if}]
        [{/foreach}]
    </div>
    <br>
[{/if}]