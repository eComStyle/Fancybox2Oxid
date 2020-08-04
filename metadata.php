<?php
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

$sMetadataVersion   = '2.0';
$aModule            = [
    'id'            => 'ecs_fancybox2oxid',
    'title'         => '<strong style="color:#04B431;">e</strong><strong>ComStyle.de</strong>:  <i>Fancybox2Oxid</i>',
    'description'   => 'Integriert die FancyBox³ im OXID eShop 6! Yeah!<br>
                       Aber werfen Sie bitte auch einen Blick auf die <a href="http://fancyapps.com/fancybox/3/#license" target="_blank"><u>Lizenz</u></a>.',
    'version'       => '1.2.4',
    'thumbnail'     => 'ecs.png',
    'author'        => '<strong style="font-size: 17px;color:#04B431;">e</strong><strong style="font-size: 16px;">ComStyle.de</strong>',
    'email'         => 'info@ecomstyle.de',
    'url'           => 'https://ecomstyle.de',
    'extend' => [
    ],
    'blocks' => [
        ['template' => 'layout/base.tpl',                   'block' => 'base_js',                       'file' => '/views/blocks/fancy_base_js.tpl'],
        ['template' => 'layout/base.tpl',                   'block' => 'base_style',                    'file' => '/views/blocks/fancy_base_style.tpl'],
        ['template' => 'page/details/inc/productmain.tpl',  'block' => 'details_productmain_zoom',      'file' => '/views/blocks/fancy_details_productmain_zoom.tpl'],
        ['template' => 'page/details/inc/productmain.tpl',  'block' => 'details_productmain_morepics',  'file' => '/views/blocks/fancy_details_productmain_morepics.tpl'],
    ],
    'settings' => [
        ['group' => 'ecs_main', 'name' => 'ecs_fancy_css',      'type' => 'bool',   'value' => 'false'],
        ['group' => 'ecs_main', 'name' => 'ecs_fancy_ful',      'type' => 'bool',   'value' => 'false'],
        ['group' => 'ecs_main', 'name' => 'ecs_fancy_classes',  'type' => 'arr',    'value' => ["details"]],
        ['group' => 'ecs_main', 'name' => 'ecs_fancy_jslink',   'type' => 'str',    'value' => 'https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.js'],
        ['group' => 'ecs_main', 'name' => 'ecs_fancy_csslink',  'type' => 'str',    'value' => 'https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.5.7/jquery.fancybox.min.css'],
    ],
    'events' => [
        'onActivate'    => '\Ecs\Fancybox2Oxid\Core\Events::onActivate',
        'onDeactivate'  => '\Ecs\Fancybox2Oxid\Core\Events::onDeactivate',
    ],
];
