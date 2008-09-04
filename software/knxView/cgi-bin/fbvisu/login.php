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
$username = $_GET['username'];
$password = $_POST['password'];

$strDatenbank = "fb.sdb";
$database = sqlite_open($strDatenbank);
	
$sql = 	"SELECT * FROM user WHERE username='".$username."' AND password ='".$password."'";

//if(sqlite_num_rows($query = sqlite_query($database, $sql)) < 1){
if($username != "kubi"	AND $password != "freebus") {
	echo "{success : false}";
}else{
	echo "{success : true}";
}
?>