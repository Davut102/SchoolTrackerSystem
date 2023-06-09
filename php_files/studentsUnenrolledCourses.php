<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];

$queryAllCourses = "SELECT course_id FROM courses";
$resultAllCourses = mysqli_query($con, $queryAllCourses);
$allCourses = array();

while ($rowData = mysqli_fetch_assoc($resultAllCourses)) {
    $allCourses[] = $rowData['course_id'];
}

//kayıt olunan dersler
$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);
$rowdata1 = mysqli_fetch_assoc($result);
$id = $rowdata1['id'];

$query2 = "SELECT Cid FROM enrollment WHERE Sid ='$id'";
$result2 = mysqli_query($con, $query2);
$courses = array();

while ($rowData2 = mysqli_fetch_assoc($result2)) {
    $courses[] = $rowData2['Cid']; 
}


// Kaydolunmamış dersleri bul
$unenrolledCourses = array_diff($allCourses, $courses);

$unenrolledCourses = array_values($unenrolledCourses);
echo json_encode($unenrolledCourses);
?>