<?php
error_reporting(0);
date_default_timezone_set('Asia/Kolkata');
$servername = "localhost";
//$username = "nucleusvision";
///$password = "nucleus@vision";
$username = "nucleus_us";
$password = "YaeKHdm5q6eaWU7vFDc6T8YKj";
$dbname = "nucleusvision";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
?>