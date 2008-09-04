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

define ('CRLF', chr(13).chr(10)); 
require("fbvisu.php");

$fb = new fbvisu();
$strDatenbank = "fb.sdb";

$fb->readJsonState2($strDatenbank);

?>