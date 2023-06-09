<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$course = $_POST['course'];
$assignmentID = $_POST['assignmentID'];

$query = "SELECT studentID, status FROM assignmentfollowing WHERE assignmentID = '$assignmentID'";
$result = mysqli_query($con, $query);

$students = array();
while ($rowdata = mysqli_fetch_assoc($result)) {
    $studentId = $rowdata['studentID'];
    $status = $rowdata['status'];

    $query2 = "SELECT fullName FROM users WHERE id = '$studentId'";
    $result2 = mysqli_query($con, $query2);
    $rowData2 = mysqli_fetch_assoc($result2);
    $fullName = $rowData2['fullName'];

    $students[] = array(
        'fullName' => $fullName,
        'status' => $status
    );
}

echo json_encode($students);
?>
