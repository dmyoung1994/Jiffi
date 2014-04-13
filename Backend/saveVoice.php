<?php

$data = $_POST['text'];
include 'scripts/connections.php';

$con = getConnection();

$statement = "INSERT INTO voice (content) VALUES (\"" . $data . "\")";
	   $result = mysqli_query($con,$statement);

echo 200;
      /*
 while($row = mysqli_fetch_array($result))
		  {
		  echo $row[0];
		  }
*/
      mysqli_close($con);


?>