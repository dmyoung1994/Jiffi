<?php

include '../scripts/connections.php';
$url = "http://content.guardianapis.com/search?q=top&tag=world&date-id=date%2Flast7days&api-key=gv5z8hpg3jjdn9hk7t4ukqh2";

//$con = getConnection();
$output = getResult($url);
$arraySize = sizeof($output->response->results);


for ($i = 0;$i< $arraySize; $i++){
	$articleLink = $output->response->results[$i]->webUrl;
	$headline = $output->response->results[$i]->webTitle;
	$headline = addslashes($headline);
	parseData($articleLink,$headline);
}

function parseData ($link,$headline){

	$dom = new DomDocument;
	$dom->loadHTMLFile("$link");
	$xpath = new DomXPath($dom);
	$nodes = $xpath->query("//p [not(@class='on') and not(@class='off') and not(contains(text(), 'Please activate cookies in order to turn autoplay off'))]");
	header("Content-type: text/plain");
	$dataString = "";
	foreach ($nodes as $i => $node) {
		$desiretext = $node->nodeValue;
		$dataString .= $desiretext;
	}
	//echo $dataString;
	insertintoDb($dataString,$headline);
}

function insertIntoDb ($data,$headline){
	$con=mysqli_connect("kalindar.com","kalindar_goh","yonghong123","kalindar_giffy");
      if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
      }

	$data = addslashes($data);
	$statement = "INSERT INTO news (content,publisher,article_name,category) VALUES (\"" . $data . "\", \"guardian\",\"" . $headline . "\", \"breakingNews\")";
	//echo $statement;
	mysqli_query($con,$statement);
	mysqli_close($con);
}

?>