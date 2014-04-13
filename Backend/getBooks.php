<?php

include 'scripts/connections.php';

$con = getConnection();

 $statement = "SELECT title,content from books";
	   //echo $statement;
	   $result = mysqli_query($con,$statement);
	   
	   $pins = array();		
      
 while($row = mysqli_fetch_assoc($result)){
		  $title = $row["title"];
		  $content = alphanumericAndSpace($row["content"]);
		  		  //echo $title;
		  		  //echo $content;
		 $pin = array("Title" => $title, "Content" => $content);
		  
		  array_push($pins,$pin);
		  //echo $pin;
		  }
		  
		  $jsonArray = array ("Pins" => $pins);
	
	echo json_encode($jsonArray);
    
  mysqli_close($con);


function alphanumericAndSpace($string){
   return preg_replace('/[^a-zA-Z0-9\s]/', '', $string);
}


?>
