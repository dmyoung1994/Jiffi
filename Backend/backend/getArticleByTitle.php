<?php

$title = $_GET["title"];

include 'scripts/connections.php';

$con = getConnection();

 //$statement = "SELECT content from news where category = \"" . $category . " and publisher = \"" . $publisher . "\"";
$statement = "SELECT content from news where title = \"" . $title . "\")";
	 //  echo $statement;
	   $result = mysqli_query($con,$statement);

       while($row = mysqli_fetch_array($result))
		  {
		  echo $row[0];
		  }
      mysqli_close($con);


?>
