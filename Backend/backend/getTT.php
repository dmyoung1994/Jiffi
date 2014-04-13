<?php

$publisher = $_GET["publisher"];

include 'scripts/connections.php';

$con = getConnection();

 $statement = "SELECT article_name,content from news where publisher = \"" . $publisher . "\"";
	  // echo $statement;
	   $result = mysqli_query($con,$statement);
	   
	   $pins = array();		
      
 while($row = mysqli_fetch_assoc($result)){
		  $title = $row["article_name"];
		  $content = $row["content"];
		  		  //echo $title;
		  		  //echo $content;
		 $pin = array("Title" => $title, "Content" => $content);
		  
		  array_push($pins,$pin);
		  //echo $pin;
		  }
		  
		  $jsonArray = array ("Pins" => $pins);
	
	echo json_encode($jsonArray);
    
  mysqli_close($con);



?>
