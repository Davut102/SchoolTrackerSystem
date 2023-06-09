<?php
include 'database.php';

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$name = $_POST['name'];
$email = $_POST['email'];
$password = $_POST['password'];
$level = $_POST['level'];

$sql = "SELECT * FROM users WHERE fullName = '".$name."' AND email = '".$email."' AND 
password = '".$password."' AND level = '".$level."'";
$result = mysqli_query($con,$sql);
$count = mysqli_num_rows($result);
if($count == 1){

  echo json_encode("Error");

} else {
	$insert = "INSERT INTO users(fullName,email,password,level)VALUES(
		'".$name."',
		'".$email."',
		'".$password."',
		'".$level."'
	)";
	$query = mysqli_query($con,$insert);
	if($query){
		echo json_encode("Success");
	}
	
}

?>