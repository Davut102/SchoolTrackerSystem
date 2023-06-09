<?php
include 'database.php';

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];
$course_id = $_POST['course_id'];

$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);
$rowdata = mysqli_fetch_assoc($result);
$id = $rowdata['id'];

$insert = "INSERT INTO enrollment (enrollment_id, Sid, Cid) VALUES (
    NULL,
    '".$id."',
    '".$course_id."'
)";

$query2 = mysqli_query($con,$insert);

?>