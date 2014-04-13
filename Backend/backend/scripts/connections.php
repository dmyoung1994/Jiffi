<?php

function getConnection(){
	$con=mysqli_connect("kalindar.com","kalindar_goh","yonghong123","kalindar_giffy");
      if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }
      
      else{
      	echo "Connection sucessful";
      }
      return $con;
}

function getResult ($url){
	$rfd = fopen($url, 'r'); 

	stream_set_blocking($rfd,true);
	stream_set_timeout($rfd, 20);  
	$status = stream_get_meta_data($rfd);
	$json = file_get_contents($url);
	fclose($rfd);
	if($status['timed_out']){
		$output = $url;
	}
	else{
		$output = json_decode($json);
	}
	return $output;
}
?>