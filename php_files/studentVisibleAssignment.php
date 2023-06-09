<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$week = $_POST['week'];
$course_id = $_POST['course_id'];
$email = $_POST['email'];

// Kullanıcının email bilgisine göre id değerini al
$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);

if (mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $userId = $row['id'];

    // Assignment verilerini çek
    $query = "SELECT a.assignmentID, a.bookName, a.bookPages, f.status
    FROM assignment a
    JOIN courseassignment c ON a.assignmentID = c.assignment_id
    JOIN assignmentfollowing f ON a.assignmentID = f.assignmentID
    WHERE c.course_id = '$course_id' AND a.week = '$week' AND f.studentID = '$userId'";

    $result = mysqli_query($con, $query);
    $assignments = array();

    while ($rowData = mysqli_fetch_assoc($result)) {
        $assignments[] = $rowData;
    }

    echo json_encode($assignments);
} else {
    echo "User not found!";
}
?>