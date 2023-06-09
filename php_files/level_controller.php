<?php
include 'database.php';

header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];
$query = $con->query("SELECT level FROM users WHERE email = '".$email."'");
$result = null;
if ($rowData = $query->fetch_assoc()) {
  $result = $rowData['level'];
}

if ($result !== null) {
  echo json_encode($result);
} else {
  http_response_code(404);
  echo json_encode(array('error' => 'Kullanıcı bulunamadı.'));
}
?>
