<?php

include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$instructor = $_POST['instructor'];

//Urlden gönderirken get
//uygulamadan gönderirken post metodunu kullan

if ($instructor != '') {
    $query = $con->query("SELECT course_id FROM courses WHERE instructor = '$instructor'");

$result = array();

while($rowData = $query->fetch_assoc()){
    $result[] = $rowData['course_id'];
}
echo json_encode($result);
   
} else {
    http_response_code(400);
   echo("Hata bulundu");
}

