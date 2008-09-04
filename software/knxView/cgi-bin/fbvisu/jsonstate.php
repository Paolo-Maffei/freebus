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
$task = '';
if ( isset($_POST['task'])){
	$task = $_POST['task'];
}
require("fbvisu.php");

$fb = new fbvisu();
$strDatenbank = "fb.sdb";

switch($task){
	case "SHOW":
	$fb->readJsonState2($strDatenbank);
	break;
	
	case "UPDATE":
    $fb->saveStateGrid($strDatenbank,$_POST['ID'],$_POST['Name'],$_POST['GA'],$_POST['State']);
    break;
	
	default:
    echo "{failure:true}";
    break;
}

?>