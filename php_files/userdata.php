<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];

$query1 = "SELECT * FROM users WHERE email = '$email'";
$result1 = mysqli_query($con, $query1);
$data = array();

while ($rowData1 = mysqli_fetch_assoc($result1)) {
    $data[] = $rowData1;
}

echo json_encode($data);
?>