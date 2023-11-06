import 'package:flutter/material.dart';
import 'package:otp_verificatio_autofill/otpautofill/otp.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../viewmodel/otprepository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phonecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Phone Number',
              ),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2)),
                child: ElevatedButton(
                    onPressed: () async {
                      if (phonecontroller.text == "") {
                        return;
                      }
                      String appsignature = await SmsAutoFill().getAppSignature;
                      final res = await fetchData(signature: appsignature);
                      debugPrint('goto next ${res.data.toString()}');

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (c) => OtpScreen(
                                res: res,
                              )));
                    },
                    child: const Text('Get OTP'))),
          ],
        ),
      ),
    );
  }
}
