<?php

$title = $_GET["title"];

include 'scripts/connections.php';

$con = getConnection();

$statement = "SELECT content from news where article_name = ". $title;
	   $result = mysqli_query($con,$statement);

       while($row = mysqli_fetch_array($result))
		  {
		  echo $row[0];
		  }
      mysqli_close($con);


?>
