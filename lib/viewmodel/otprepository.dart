import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otp_verificatio_autofill/otpautofill/constants.dart';

Future<Response> fetchData({required String signature}) async {
  final dio = Dio();
  late Response response;
  try {
    response = await dio.get(
      otpUrl,
      queryParameters: {'app_signature': signature},
    );

    if (response.statusCode == 200) {
      // Successful response
      debugPrint('Response data: ${response.data}');
      return response;

      // You can parse the JSON response here and use the data as needed.
    } else {
      // Handle other status codes if needed.
      debugPrint('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any network or request errors here.
    debugPrint('Error: $e');
  }
  return response;
}
