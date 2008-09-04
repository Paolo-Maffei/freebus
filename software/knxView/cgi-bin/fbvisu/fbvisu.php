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

class fbvisu{
	
	function test() 
	{
		echo "TEST";
	}
	
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
			//echo "Erfolgreich: ".$data;
		}
	}
	
	function rsRead($comport,$sekunden)
	{
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
		fclose ($fp);
		return $buffer;
		
		
	}
	
	function writeState($db, $GA, $state) {
		$database = new SQLiteDatabase($db, 0666, $error);
		if (!$database) 
		{
			$error = (file_exists($db)) ? "Impossible to open, check permissions" : "Impossible to create, check permissions";
			die($error);
		}
	
		$database->query("update eib set state=".$state." where GA='".$GA."'",$query_error); 
		$dbchange = $database->changes();
		if(!$dbchange) 
		{
			$database->queryExec("INSERT INTO eib (GA, Name, State) VALUES ('".$GA."', 'Unbekannt2', '".$state."')");
		}
		
		unset($database);
	}
	
	
	function readState($db, $GA) {
		$database = new SQLiteDatabase($db, 0666, $error);
		
		$query = $database->query("SELECT state FROM eib where GA='".$GA."'", SQLITE_ASSOC, $query_error);
				
		while ($row = $query->fetch()){
			return $row['State'];
		}
		
	}
	
	function readStateNeg($db, $GA) {
		$database = new SQLiteDatabase($db, 0666, $error);

		$query = $database->query("SELECT State FROM eib where GA='".$GA."'", SQLITE_ASSOC, $query_error);
				
		while ($row = $query->fetch()){
			return 0;
			if ($row['State'] == 1) {
				return 0;
			} else {
				return 1;
			}
			
		}
		
	}
	function writeState2($db, $GA, $state) {
		$database = sqlite_open($db);
			
		sqlite_query($database, "update eib set state=".$state." where GA='".$GA."'"); 
		$dbchange = sqlite_changes($database);
		if(!$dbchange) 
		{
			sqlite_query($database,"INSERT INTO eib (GA, Name, State) VALUES ('".$GA."', 'Unbekannt', '".$state."')");
		}
		
		sqlite_close($database);
	}
	
	
	function readJsonState($db) {
		$database = new SQLiteDatabase($db, 0666, $error);
		$count = 0;
		if (!$database) 
		{
			$error = (file_exists($yourfile)) ? "Impossible to open, check permissions" : "Impossible to create, check permissions";
			die($error);
		}
		$query = $database->query("SELECT * FROM eib", SQLITE_ASSOC, $query_error);
		if ($query_error)
			die("Error: $query_error"); 
		if (!$query)
			die("Impossible to execute query.");
		
		while ($row = $query->fetch()){
			$count++;
			$data[] = array('Name' => $row['Name'],
							'GA' => $row['GA'],
							'State' => $row['State']
							);
		}
		$myData = array('data' => $data, 'totalCount' => $count);
		unset($database);
		if (version_compare(PHP_VERSION,"5.2","<"))
		{    
			require_once("./JSON.php"); //if php<5.2 need JSON class
			$json = new Services_JSON();//instantiate new json object
			echo $json->encode($myData);  //encode the data in json format
		} else
		{
			echo json_encode($myData);  //encode the data in json format
		}
	}
	
	function readJsonState2($db) {
		$database = sqlite_open($db);
		$count = 0;
		
		$query = sqlite_query($database, "SELECT * FROM eib");
				
		while ($row = sqlite_fetch_array($query)){
			$count++;
			$data[] = array('ID' => $row['id'],
							'Name' => $row['Name'],
							'GA' => $row['GA'],
							'State' => $row['State']
							);
		}
		$myData = array('data' => $data, 'totalCount' => $count);
		sqlite_close($database);
		
		if (version_compare(PHP_VERSION,"5.2","<"))
		{    
			require_once("./JSON.php"); //if php<5.2 need JSON class
			$json = new Services_JSON();//instantiate new json object
			echo $json->encode($myData);  //encode the data in json format
		} else
		{
			echo json_encode($myData);  //encode the data in json format
		}
	}

	function saveStateGrid($db, $ID, $name, $GA, $state) {
		$database = new SQLiteDatabase($db, 0666, $error);
		if (!$database) 
		{
			$error = (file_exists($db)) ? "Impossible to open, check permissions" : "Impossible to create, check permissions";
			echo '0';
			die($error);
		}
	
		$database->query("update eib set State='".$state."',Name='".$name."',GA='".$GA."' where id='".$ID."'",$query_error); 
		unset($database);
		echo '1';        // success

	}
	
}
?>