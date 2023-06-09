<?php
include 'database.php';
header('Content-Type: application/json; charset=utf-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST, GET, OPTION, PUT, DELETE');
header('Access-Control-Allow-Headers: Content-Type, X-Auth-Token, Origin, Authorization');

$email = $_POST['email'];
$password = $_POST['password'];
$fullName = $_POST['fullName'];
$oldEmail = $_POST['oldEmail'];

$query = "UPDATE users SET ";

if (!empty($email)) {
    $query .= "email = '$email', ";
}

if (!empty($password)) {
    $query .= "password = '$password', ";
}

if (!empty($fullName)) {
    $query .= "fullName = '$fullName', ";
}

// Remove the trailing comma and space
$query = rtrim($query, ", ");

// Add a WHERE clause to specify the record to update
$query .= " WHERE email = '$oldEmail'";

if (!empty($email) || (!empty($password) || !empty($fullName))) {
    // At least one field (password or fullName) is provided along with the email
    $result = mysqli_query($con, $query);

    if ($result) {
        // Successful update
        $response = array(
            'status' => 'success',
            'message' => 'Veri başarıyla güncellendi.'
        );
    } else {
        // Update failed
        $response = array(
            'status' => 'error',
            'message' => 'Veri güncelleme işlemi başarısız oldu.'
        );
    }
} else {
    // No fields provided to update
    $response = array(
        'status' => 'error',
        'message' => 'Güncellenecek veriler eksik.'
    );
}

echo json_encode($response);
?>
