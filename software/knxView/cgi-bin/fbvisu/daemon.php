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

// Die erstellten Cronjobs laden
passthru("crontab cron.tmp 2>&1");

$fb = new fbvisu();
$strDatenbank = "fb.sdb";

//for($i=0; $i < 50; $i++){
while(1){
	$rsIn = $fb->rsRead("/dev/ttyS0","0");
	
	$rsArr = explode("=",$rsIn);
		
	if($rsArr[1] != "") {
		$rsArr[0] = str_replace(".", "/", $rsArr[0]);
		echo "GA: ".$rsArr[0]."  Status: ".$rsArr[1];
		$fb->writeState2($strDatenbank, $rsArr[0], $rsArr[1]);
		
		passthru('echo "led blink 1" > /dev/gpio0');
		passthru('lcd_out_4x20 -2');
		passthru('lcd_out_4x20 "read: '.$rsArr[0].' = '.$rsArr[1].'"');
		passthru('echo "led blink 0" > /dev/gpio0');
	}
}
?>