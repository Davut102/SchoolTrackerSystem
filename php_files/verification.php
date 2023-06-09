<?php
include 'database.php';

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];
$name = $_POST['name'];
$sql = "SELECT * FROM users WHERE email = '$email'";
$sql1 = "SELECT * FROM users WHERE fullName = '$name'";
$result = mysqli_query($con,$sql);
$result1 = mysqli_query($con,$sql1);
$count = mysqli_num_rows($result);
$count1 = mysqli_num_rows($result1);

if($count == 1 or $count1 == 1){

  http_response_code(200); exit;

} else {
	http_response_code(400); exit;
}
?>