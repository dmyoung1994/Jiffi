<?php

include "Services/Twilio/Capability.php";

$accountSid = "ACXXXXXXXXXXXXXXXX"; 
$authToken = "secret";

// The app outgoing connections will use:
$appSid = "APabe7650f654fc34655fc81ae71caa3ff"; 

// The client name for incoming connections:
$clientName = "monkey"; 

$capability = new Services_Twilio_Capability($accountSid, $authToken);

// This allows incoming connections as $clientName: 
$capability->allowClientIncoming($clientName);

// This allows outgoing connections to $appSid with the "From" parameter being $clientName 
$capability->allowClientOutgoing($appSid, array(), $clientName);

// This returns a token to use with Twilio based on 
// the account and capabilities defined above 
$token = $capability->generateToken();

echo $token;
?>