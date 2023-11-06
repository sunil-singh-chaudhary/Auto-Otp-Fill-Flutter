// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatefulWidget {
  Response res;
  OtpScreen({
    Key? key,
    required this.res,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? code;
  @override
  void initState() {
    super.initState();
    listenCode();
  }

  listenCode() {
    SmsAutoFill().listenForCode;
    SmsAutoFill().code.listen((code) {
      setState(() {
        this.code = code;
      });
    });

    debugPrint('sms code $code');
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Screen'),
      ),
      body: Center(
        child: PinFieldAutoFill(
          decoration: UnderlineDecoration(
            textStyle: const TextStyle(fontSize: 20, color: Colors.black),
            colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
          ),
          currentCode: code,
          codeLength: 4,
          onCodeSubmitted: (code) {
            debugPrint('onCodeSubmitted-- $code');
          },
          onCodeChanged: (code) {
            if (code!.length == 4) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
          },
        ),
      ),
    );
  }
}
