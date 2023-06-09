<?php

include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$course = $_POST['course'];
$bookName = $_POST['bookName'];
$bookPages = $_POST['bookPages'];
$week = $_POST['week'];

$sql = "SELECT assignmentID FROM assignment WHERE bookName = '".$bookName."' AND 
bookPages = '".$bookPages."' AND week = '".$week."'";
$result = mysqli_query($con, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
  $row = mysqli_fetch_assoc($result);
  $assignmentID = $row['assignmentID'];
  
  $deleteAssignment = "DELETE FROM assignment WHERE assignmentID = '".$assignmentID."'";
  $deleteCourseAssignment = "DELETE FROM courseassignment WHERE assignment_id = '".$assignmentID."'";
  
  $deleteResult1 = mysqli_query($con, $deleteAssignment);
  $deleteResult2 = mysqli_query($con, $deleteCourseAssignment);
  
  if ($deleteResult1 && $deleteResult2) {
    echo json_encode(["message" => "Success"]);
  } else {
    http_response_code(500);
    echo json_encode(["message" => "Error"]);
  }
} else {
  http_response_code(400);
  echo json_encode(["message" => "Error"]);
}
?>