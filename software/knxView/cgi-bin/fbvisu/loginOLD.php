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
$username = $_POST['username'];
$password = $_POST['password'];

if($username == "brauns" AND $password == "xbF39Kb") {
	echo "{success : true}";
} else {
	echo "{success : false}";
	//echo "{message : 'ALERT - Die Anmeldung ist fehlgeschlagen !!!'}";
}
?>