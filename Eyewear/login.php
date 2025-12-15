<?php
// Start session BEFORE any output
session_start();

// Prevent header issues
ob_start();

// Get input
$UserName = $_POST['txtUserName'] ?? '';
$Password = $_POST['txtPassword'] ?? '';
$UserType = $_POST['rdType'] ?? '';

// Include database connection
include __DIR__ . "/Connections/shop.php";   // :contentReference[oaicite:0]{index=0}

// Validate empty fields
if (empty($UserName) || empty($Password)) {
    echo "<script>alert('Please enter username & password'); window.location='index.php';</script>";
    exit;
}

if ($UserType == "Admin") {

    $sql = "SELECT * FROM Admin_Master WHERE UserName=? AND Password=?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, "ss", $UserName, $Password);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) == 0) {
        echo "<script>alert('Wrong Username or Password'); window.location='index.php';</script>";
        exit;
    }

    header("Location: Admin/index.php");
    exit;

} elseif ($UserType == "Customer") {

    $sql = "SELECT * FROM Customer_Registration WHERE UserName=? AND Password=?";
    $stmt = mysqli_prepare($con, $sql);
    mysqli_stmt_bind_param($stmt, "ss", $UserName, $Password);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) == 0) {
        echo "<script>alert('Wrong Username or Password'); window.location='index.php';</script>";
        exit;
    }

    $row = mysqli_fetch_assoc($result);
    $_SESSION['ID'] = $row['CustomerId'];
    $_SESSION['Name'] = $row['CustomerName'];

    header("Location: Customer/index.php");
    exit;
}

// Close connection properly
mysqli_close($con);

// Flush output buffer to avoid header errors
ob_end_flush();
?>
