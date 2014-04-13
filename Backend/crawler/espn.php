<?php

include '../scripts/connections.php';
$url = "http://api.espn.com/v1/now/top/?apikey=utfwctg3n3svqvuajqz7nnmt&league=soccer";

//$con = getConnection();
$output = getResult($url);
$arraySize = sizeof($output->feed);

for ($i = 0;$i< $arraySize; $i++){
	$articleLink = $output->feed[$i]->links->web->href;
	$headline = $output->feed[$i]->headline;
	$headline =addslashes($headline);
	parseData($articleLink,$headline);
}


function parseData ($link,$headline){

	$dom = new DomDocument;
	$dom->loadHTMLFile("$link");
	$xpath = new DomXPath($dom);
	$nodes = $xpath->query("//p");
	header("Content-type: text/plain");
	$dataString = "";
	foreach ($nodes as $i => $node) {
		$desiretext = $node->nodeValue;
		$dataString .= $desiretext;
	}
	$dataString = alphanumericAndSpace($dataString);
	insertintoDb($dataString,$headline);
}

function insertIntoDb ($data,$headline){
	$con=mysqli_connect("kalindar.com","kalindar_goh","yonghong123","kalindar_giffy");
      if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

	$data = addslashes($data);
	$statement = "INSERT INTO news (content,publisher,article_name,category) VALUES (\"" . $data . "\", \"espn\",\"" . $headline . "\", \"sports\")";
	mysqli_query($con,$statement);
	mysqli_close($con);
}

function alphanumericAndSpace($string){
   return preg_replace('/[^a-zA-Z0-9\s]/', '', $string);
}

echo $arraySize . " records added!"; 
?>