<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$week = $_POST['week'];
$course_id = $_POST['course_id'];

$query1 = "SELECT assignment_id FROM courseassignment WHERE course_id = '$course_id'";
$result1 = mysqli_query($con, $query1);
$assignmentIds = array();

while ($rowData1 = mysqli_fetch_assoc($result1)) {
    $assignmentIds[] = $rowData1['assignment_id'];
}

$assignments = array();

foreach ($assignmentIds as $assignmentId) {
    $query2 = "SELECT assignmentID, bookName, bookPages FROM assignment WHERE week = '$week' AND assignmentID = '$assignmentId'";
    $result2 = mysqli_query($con, $query2);
    
    while ($rowData2 = mysqli_fetch_assoc($result2)) {
        $assignments[] = $rowData2;
    }
}

echo json_encode($assignments);
?> 