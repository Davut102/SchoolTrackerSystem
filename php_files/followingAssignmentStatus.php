<?php
include 'database.php';
include 'visibleAssignment';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];

$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);
$status = array();

foreach ($assignmentIds as $assignmentId) {
    $query2 = "SELECT assignmentID, status FROM assignmentfollowing WHERE assignmentID = '$assignmentId' AND studentID = '$user_id'";
    $result2 = mysqli_query($con, $query2);
    
    while ($rowData2 = mysqli_fetch_assoc($result2)) {
        $status[] = $rowData2;
    }
}

    echo json_encode("User not found.");
?>
