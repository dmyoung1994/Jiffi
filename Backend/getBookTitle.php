<?php


include 'scripts/connections.php';

$con = getConnection();

$statement = "SELECT title from books";
	   $result = mysqli_query($con,$statement);

       while($row = mysqli_fetch_array($result))
		  {
		  echo $row[0]; echo " ";
		  }
      mysqli_close($con);


?>
