<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$course = $_POST['course'];

$query = "SELECT Sid FROM enrollment WHERE Cid = '$course'";
$result = mysqli_query($con, $query);

$id = array(); // Diziyi tanımla

while ($rowdata = mysqli_fetch_assoc($result)) {
    $id[] = $rowdata['Sid']; // 'Sid' kullan
}
$students = array();
foreach ($id as $studentId) {
    $query2 = "SELECT fullName FROM users WHERE id = '$studentId'";
    $result2 = mysqli_query($con, $query2);
    $rowData2 = mysqli_fetch_assoc($result2);
    $students[] = $rowData2['fullName'];
}
echo json_encode($students);
?>
