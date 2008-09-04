#!/usr/bin/php
<?php
/***************************************************************
* Copyright notice
*
* (c) 2008 Sven Braun <info@sb-computer.eu> 
* All rights reserved
****************************************************************
* knxView
* @author: Sven Braun
***************************************************************/
//
echo "
[{
    text:'EIBvi',
    expanded: true,
	children:[{
        text:'Status Grid',
        id:'stategrid',
        leaf:true
    },{
        text:'Schalten',
        id:'tabs33',
        leaf:true
    }]
},{
	text:'Basic Ext Layouts',
    children:[{
        text:'Absolute',
        id:'absolute',
        leaf:true
    },{
        text:'Accordion',
        id:'accordion',
        leaf:true
    },{
        text:'Anchor',
        id:'anchor',
        leaf:true
    },{
        text:'Border',
        id:'border',
        leaf:true
    },{
        text:'Card (TabPanel)',
        id:'card-tabs',
        leaf:true
    },{
        text:'Card (Wizard)',
        id:'card-wizard',
        leaf:true
    },{
        text:'Column',
        id:'column',
        leaf:true
    },{
        text:'Fit',
        id:'fit',
        leaf:true
    },{
        text:'Form',
        id:'form',
        leaf:true
    },{
        text:'Table',
        id:'table',
        leaf:true
    }]
},{
    text:'Custom Layouts',
    children:[{
        text:'Row',
        id:'row',
        leaf:true
    },{
        text:'Center',
        id:'center',
        leaf:true
    }]
},{
    text:'Combination Examples',
    children:[{
        text:'Absolute Layout Form',
        id:'abs-form',
        leaf:true
    },{
        text:'Tabs with Nested Layouts',
        id:'tabs-nested-layouts',
        leaf:true
    }]
}]";
?>