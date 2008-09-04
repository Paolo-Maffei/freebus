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

// Wird von fb_rs_send.cgi aufgerufen und schreibt die werte in die Datenbank!
//fbs01/02/3/000
$state = $_GET["state"];
$GA = $_GET["GA"];
//echo $GA;

$GA = substr($GA, 6, strlen($GA)-5 );
$GA = str_replace("/", ".", $GA);
$GA = str_replace("0", "", $GA);

require("fbvisu.php");
$fb = new fbvisu();
$strDatenbank = "fb.sdb";
$fb->writeState2($strDatenbank, $GA, $state);
?>