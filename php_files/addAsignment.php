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

$sql = "SELECT * FROM assignment WHERE bookName = '".$bookName."' AND 
bookPages = '".$bookPages."' AND week = '".$week."'";
$result = mysqli_query($con, $sql);
$count = mysqli_num_rows($result);

if ($count == 1) {
  http_response_code(400);
  echo json_encode(["message" => "Error"]);
} else {
  $insert = "INSERT INTO assignment(bookName, bookPages, week) VALUES (
    '".$bookName."',
    '".$bookPages."',
    '".$week."'
  )";
  $query = mysqli_query($con, $insert);

  if ($query) {
    $assignmentID = mysqli_insert_id($con); // Eklenecek assignmentID'yi almak için mysqli_insert_id() fonksiyonunu kullanabilirsiniz
    
    $lastquery = "INSERT INTO courseassignment (assignment_id, course_id) VALUES (
      '".$assignmentID."',
      '".$course."'
    )";
    $lastResult = mysqli_query($con, $lastquery);

    $studentQuery = "SELECT Sid FROM enrollment WHERE Cid = '$course'";

    $studentResult = mysqli_query($con, $studentQuery);

    $studentIDs = array();

    if ($studentResult) {
      while ($row = mysqli_fetch_assoc($studentResult)) {
        $studentID = $row['Sid'];

        $insertQuery = "INSERT INTO assignmentfollowing (assignmentID, studentID) VALUES (
          '".$assignmentID."',
          '".$studentID."'
        )";
        $insertResult = mysqli_query($con, $insertQuery);

        if (!$insertResult) {
          http_response_code(500);
          echo json_encode(["message" => "Error"]);
          exit; 
        }
      }
    }

    
    if ($lastResult) {
      echo json_encode(["message" => "Success"]);
    } else {
      http_response_code(500);
      echo json_encode(["message" => "Error"]);
    }
  } else {
    http_response_code(500);
    echo json_encode(["message" => "Error"]);
  }
}
?>
