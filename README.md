# otp_verificatio_autofill

## Introduction

`otp_verificatio_autofill` is a Flutter mobile application that simplifies the OTP (One-Time Password) verification process by automatically handling OTP code input. In Android, it uses the `sms_autofill` library to detect and fill OTP codes. In iOS, it provides a smooth OTP code input experience. Additionally, this application demonstrates how to interact with a server to generate OTP codes based on an app signature using PHP.

## Features

- Automatic OTP code detection and filling for Android.
- Smooth OTP code input experience in iOS.
- Demonstrates how to generate OTP codes using an app signature on the server.

## Getting Started

Follow these steps to get started with `otp_verificatio_autofill`:

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/otp_verificatio_autofill.git
   cd otp_verificatio_autofill 
   
   ```


## Backend API (PHP)

   ```bash

   <?php
header("Content-Type: application/json");

// Check if the request is a GET request
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // Check if the app_signature parameter is provided in the URL
    if (isset($_GET['app_signature'])) {
        // Generate a random 4-digit OTP for testing purposes
        $otp = strval(rand(1000, 9999));

        // Create the response message in the desired format
        $response = "<#> Your OTP code is " . $otp . " " . $_GET['app_signature'];

        echo json_encode(array("otp_message" => $response));
    } else {
        echo json_encode(array("error" => "Missing app_signature parameter"));
    }
} else {
    echo json_encode(array("error" => "Invalid request method"));
}
?>


   ```


   ## API URL 

   ```bash

   https://yourserver.com/otptestverification/generateotp.php?app_signature=yourAppSignature

   ```



