<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$assignmentID = $_POST['assignmentID'];
$email = $_POST['email'];
$status = $_POST['status'];

// Kullanıcının email bilgisine göre id değerini al
$query = "SELECT id FROM users WHERE email = '$email'";
$result = mysqli_query($con, $query);

if ($result && mysqli_num_rows($result) > 0) {
    $row = mysqli_fetch_assoc($result);
    $userId = $row['id'];

    // Assignment verilerini güncelle
    $query = "UPDATE assignmentfollowing SET status = '$status' WHERE assignmentID = '$assignmentID' AND studentID = '$userId'";

    $updateResult = mysqli_query($con, $query);

    if ($updateResult) {
        echo "Update successful.";
    } else {
        echo "Update failed.";
    }
} else {
    echo "User not found!";
}
?>