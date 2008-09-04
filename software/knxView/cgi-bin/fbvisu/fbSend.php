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

//$state = $_GET["state"];
//$GA = $_GET["GA"];
$state = $_POST["state"];
$GA = $_POST["GA"];


$arrGA = explode("/", $GA);
$arrGA[0] = str_pad($arrGA[0], 2, '0', STR_PAD_LEFT);
$arrGA[2] = str_pad($arrGA[2], 3, '0', STR_PAD_LEFT);
define ('CRLF', chr(13).chr(10)); 
$GAsend = implode("/", $arrGA);

require("fbvisu.php");
$fb = new fbvisu();
$strDatenbank = "fb.sdb";

echo $fb->rsSend("/dev/ttyS0", "fbs01/".$GAsend."=".$state.CRLF);
$fb->writeState($strDatenbank, $GA, $state);

passthru('echo "led blink 1" > /dev/gpio0');
passthru('lcd_out_4x20 -2');
passthru('lcd_out_4x20 "send: '.$GA.' = '.$state.'"');
passthru('echo "led blink 0" > /dev/gpio0');
?>