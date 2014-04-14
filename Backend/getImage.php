<?php

 
  $applicationId = 'jiffyapp';
  $password = 'dT/1kIuiAibNLMDRYcFshxY4';

  /*
 $file = 'images/test.png';
   $success = file_put_contents($file, $image_data);
   print $success ? $file : 'Unable to save the file.';
*/
 
 	$uploaddir = 'images/';
 	//$fileName = basename($_FILES['uploadedfile']['name']);
 	//$fileName = 'screwYou.jpg';
 	
 	$fileName = uniqid('img_') . ".jpg";
 	//$fileName = "img_534ac1c6bb1ca.jpg";
 	//$fileName = "IMG_0123.jpg";
 	/*
 	echo("printing file:");
 	print_r($file);
 	echo "file=".$fileName; //is empty, but shouldn't
 	*/
 	
 	$uploadfile = $uploaddir . $fileName;
 		
if (move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $uploadfile)) {
	}
	else {
	    echo "error";
	}

  $local_directory='images/';
  $filePath = $local_directory.'/'.$fileName;
  if(!file_exists($filePath))
  {
    die('File '.$filePath.' not found.');
  }
  if(!is_readable($filePath) )
  {
     die('Access to file '.$filePath.' denied.');
  }
  
  $url = 'http://cloud.ocrsdk.com/processImage?language=english&exportFormat=txt';
  
  $curlHandle = curl_init();
  curl_setopt($curlHandle, CURLOPT_URL, $url);
  curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
  curl_setopt($curlHandle, CURLOPT_USERPWD, "$applicationId:$password");
  curl_setopt($curlHandle, CURLOPT_POST, 1);
  curl_setopt($curlHandle, CURLOPT_USERAGENT, "PHP Cloud OCR SDK Sample");
  $post_array = array(
      "my_file"=>"@".$filePath,
  );
  curl_setopt($curlHandle, CURLOPT_POSTFIELDS, $post_array); 
  $response = curl_exec($curlHandle);
  if($response == FALSE) {
    $errorText = curl_error($curlHandle);
    curl_close($curlHandle);
    die($errorText);
  }
  $httpCode = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
  curl_close($curlHandle);

  $xml = simplexml_load_string($response);
  if($httpCode != 200) {
    if(property_exists($xml, "message")) {
       die($xml->message);
    }
    die("unexpected response ".$response);
  }

  $arr = $xml->task[0]->attributes();
  $taskStatus = $arr["status"];
  if($taskStatus != "Queued") {
    die("Unexpected task status ".$taskStatus);
  }
  
  $taskid = $arr["id"];  
  $url = 'http://cloud.ocrsdk.com/getTaskStatus';
  $qry_str = "?taskid=$taskid";

  while(true)
  {
    sleep(5);
    $curlHandle = curl_init();
    curl_setopt($curlHandle, CURLOPT_URL, $url.$qry_str);
    curl_setopt($curlHandle, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curlHandle, CURLOPT_USERPWD, "$applicationId:$password");
    curl_setopt($curlHandle, CURLOPT_USERAGENT, "PHP Cloud OCR SDK Sample");
    $response = curl_exec($curlHandle);
    $httpCode = curl_getinfo($curlHandle, CURLINFO_HTTP_CODE);
    curl_close($curlHandle);
  
    $xml = simplexml_load_string($response);
    if($httpCode != 200) {
      if(property_exists($xml, "message")) {
        die($xml->message);
      }
      die("Unexpected response ".$response);
    }
    $arr = $xml->task[0]->attributes();
    $taskStatus = $arr["status"];
    if($taskStatus == "Queued" || $taskStatus == "InProgress") {
      // continue waiting
      continue;
    }
    if($taskStatus == "Completed") {
      // exit this loop and proceed to handling the result
      break;
    }
    if($taskStatus == "ProcessingFailed") {
      die("Task processing failed: ".$arr["error"]);
    }
    die("Unexpected task status ".$taskStatus);
  }

  // Result is ready. Download it

  $url = $arr["resultUrl"];  
  //echo $url; 
  parseData($url);
  
  function parseData ($link){
  	header('Content-Type: text; charset=UTF-8');
	 $dataString = file_get_contents($link);
	 $dataString = alphanumericAndSpace($dataString);
	 echo $dataString;
	insertintoDb($dataString);
}

function insertIntoDb ($data){
	$con=mysqli_connect("");
      if (mysqli_connect_errno()){
         "Failed to connect to MySQL: " . mysqli_connect_error();
      }
	$statement = "INSERT INTO picture (content) VALUES (\"" . $data . "\")";
	//echo $statement;
	mysqli_query($con,$statement);
	mysqli_close($con);
}

function alphanumericAndSpace($string){
   return preg_replace('/[^a-zA-Z0-9\s]/', '', $string);
}
 
?>