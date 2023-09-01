<?php
// Connecting to the database with the following credentials("host","user","password","database")
$conn = @(new mysqli("cronguard_db", "cronguard", "top_secret", "cronguard"));
if ($conn->connect_error) {
  echo "Error while connecting: " . mysqli_connect_error();
  exit();
}
?>
