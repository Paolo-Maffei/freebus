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

// Initialisieren: Die Serielleschnittstelle initialisieren
rsInit("\\.\com1","115200"); 

// Schreiben: 
rsSend("\\.\com1","fbs01/01/1/001=1".CRLF); 

// Lesen: 2 sekunden Lang von der COM1 lesen
$test = rsRead("\\.\com1","2"); 
echo $test; 



function rsInit($com,$bautrate)
{
	`mode $com: BAUD=$bautrate PARITY=N data=8 stop=1 xon=off`;
}


function rsSend($comport,$data)
{
	$fp = fopen ("$comport", "w+");
	if (!$fp)
	{
		echo "Der Serialport ".$comport." konnte nich geöffnet werden !";
	}
	else {
		fputs ($fp, $data);
		fclose ($fp);
	}
}



function rsRead($comport,$sekunden)
{
	$buffer = "";
	$fp = fopen ("$comport", "r+");

	if (!$fp)
	{
		echo "Der Serialport ".$comport." konnte nich geöffnet werden !";
	}
	else
	{
		sleep($sekunden);
		$buffer .= fgets($fp, 4096);
	}
	return $buffer;
	fclose ($fp);
}
?>