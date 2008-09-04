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

if ( isset($_POST['task'])){
	$task = $_POST['task'];
}

//$task = $_GET['task']; 

switch($task){
	case "SHOW":
		$crontab=array();
		exec("crontab -l 2>&1",$crontab);
		array_splice($crontab,0,3);		// Die ersten 3 ausblenen (Sind standardm‰ﬂig enthalten)
		
		for($i=0; $i<count($crontab); $i++){
			$row=explode("\t", $crontab[$i]);
			$data[] = array('ID' => $i,
						'Minute' => $row['0'],
						'Stunde' => $row['1'],
						'Tag' => $row['2'],
						'Monat' => $row['3'],
						'Wochentag' => $row['4'],
						'Befehl' => $row['5'],
						'Beschreibung' => str_replace("#","",$row['6'])
						);
		}

		$myData = array('data' => $data, 'totalCount' => count($data));

		if (version_compare(PHP_VERSION,"5.2","<")) {    
			require_once("./JSON.php"); //if php<5.2 need JSON class
			$json = new Services_JSON();//instantiate new json object
			echo $json->encode($myData);  //encode the data in json format
		} else {
			echo json_encode($myData);  //encode the data in json format
		}
	break;
	
	case "ADD":
		$crontab=array();
		exec("crontab -l 2>&1",$crontab);
		//array_splice($crontab,0,3);		// Die ersten 3 ausblenen (Sind standardm‰ﬂig enthalten)

		for($i=0; $i<count($crontab); $i++){
			$row=explode("\t", $crontab[$i]);
			$data[] = array(
						'Minute' => $row['0'],
						'Stunde' => $row['1'],
						'Tag' => $row['2'],
						'Monat' => $row['3'],
						'Wochentag' => $row['4'],
						'Befehl' => $row['5'],
						'Beschreibung' => "#".$row['6']
						);
		}
		
		// Befehl erstellen
		$befehl = "php /var/www/cgi-bin/fbvisu/fbSend.php?GA='".$_POST['GA']."'&state='".$_POST['State']."'";
		
		//Workarround, bis es wieder geht :-(
		// Umwandeln der GruppenAdresse von 1/1/7 in 01/1/007
		$arrGA = explode("/", $_POST['GA']);
		$arrGA[0] = str_pad($arrGA[0], 2, '0', STR_PAD_LEFT);
		$arrGA[2] = str_pad($arrGA[2], 3, '0', STR_PAD_LEFT);
		define ('CRLF', chr(13).chr(10)); 
		$GAsend = implode("/", $arrGA);
		
		$befehl = 'echo "fbs01/'.$GAsend.'='.$_POST['state'].'" > /dev/ttyS0';
		
		
		// Neu erstellten Crontab hinzuf¸gen
		$data[] = array(
						'Minute' => $_POST['Minute'],
						'Stunde' => $_POST['Stunde'],
						'Tag' => $_POST['Tag'],
						'Monat' => $_POST['Monat'],
						'Wochentag' => $_POST['Wochentag'],
						'Befehl' => $befehl,
						'Beschreibung' => "#".$_POST['Beschreibung']
					);
		
		$datei=fopen("cron.tmp","w");
		for($j=0; $j<count($data); $j++){
			fputs($datei,trim(implode("\t",$data[$j]))."\n");
		}
		fclose($datei);

		passthru("crontab cron.tmp 2>&1",$crontab2);
		
		echo '1';
		break;
	
	case "DELETE":
		$ids = $_POST['ids']; // Get our array back and translate it :
				
		if (version_compare(PHP_VERSION,"5.2","<"))  {    
			require_once("./JSON.php"); 
			$json = new Services_JSON();
			$idCron = $json->decode(stripslashes($ids));
		} else {
			$idCron = json_decode(stripslashes($ids));
		}
		
		if(sizeof($idCron)<1){
			echo '0';
			break;
		} else if (sizeof($idCron) == 1){
			// Lˆsche einen Cronjob
			$crontab=array();
			exec("crontab -l 2>&1",$crontab);
			
			for($i=0; $i<count($crontab); $i++){
				if ($idCron[0]+3 != $i) { 
					$row=explode("\t", $crontab[$i]);
					$data[] = array(
							'Minute' => $row['0'],
							'Stunde' => $row['1'],
							'Tag' => $row['2'],
							'Monat' => $row['3'],
							'Wochentag' => $row['4'],
							'Befehl' => $row['5'],
							'Beschreibung' => $row['6']
					);
				}
			}
			
			
			$datei=fopen("cron.tmp","w");
			for($j=0; $j<count($data); $j++){
				fputs($datei,trim(implode("\t",$data[$j]))."\n");
			}
			fclose($datei);
			passthru("crontab cron.tmp 2>&1",$crontab2);
		}

		echo '1';
		break;
	
	default:
		echo "{failure:true}";
		break;
}

?>