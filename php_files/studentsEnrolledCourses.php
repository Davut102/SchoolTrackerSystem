<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];

$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);
$rowdata = mysqli_fetch_assoc($result);
$id = $rowdata['id'];

$query2 = "SELECT Cid FROM enrollment WHERE Sid ='$id'";
$result2 = mysqli_query($con, $query2);
$courses = array();

while ($rowData2 = mysqli_fetch_assoc($result2)) {
    $courses[] = $rowData2['Cid']; 
}
echo json_encode($courses);
?>