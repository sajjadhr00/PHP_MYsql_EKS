
<?php
/**
 * Centralized MySQL Database Connection
 * Works for XAMPP, Docker, EKS Fargate, EC2 MySQL
 */

// Environment variables (Kubernetes, Docker)
$DB_HOST = getenv("DB_HOST") ?: "localhost";
$DB_NAME = getenv("DB_NAME") ?: "shopping";
$DB_USER = getenv("DB_USER") ?: "sk";
$DB_PASS = getenv("DB_PASSWORD") ?: "My@2025";

// Create connection
$con = mysqli_connect($DB_HOST, $DB_USER, $DB_PASS, $DB_NAME);

// Error handling
if (!$con) {
    error_log("DB Connection failed: " . mysqli_connect_error());
    die("Database connection failed!");
}
?>