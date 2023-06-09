<?php
$host = "localhost:4306";
$username = "root";
$password = "";
$dbname = "school_tracking_system";

// MySQL sunucusuna bağlanmak için mysqli_connect() fonksiyonu kullanılır
$con = mysqli_connect($host, $username, $password, $dbname);

// Bağlantı kontrolü
if (!$con) {
    die("Database Bağlantısı başarısız: " . mysqli_connect_error());
}
?>