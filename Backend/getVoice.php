<?php


include 'scripts/connections.php';

$con = getConnection();

$statement = "SELECT content from voice";
	   $result = mysqli_query($con,$statement);
      mysqli_close($con);


?>