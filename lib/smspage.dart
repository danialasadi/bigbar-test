import 'package:bigbar/dioapi.dart';
import 'package:bigbar/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key, required this.number});
  final String number;
  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Pinput(
              autofocus: true,
              closeKeyboardWhenCompleted: true,
              isCursorAnimationEnabled: true,
              keyboardType: TextInputType.number,
              length: 4,
              enabled: true,
              controller: pinController,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (value) async {
                bool resault = false;
                resault = await AppApi().verifyNumber(
                    number: widget.number, code: pinController.text);
                if (resault == true) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FirstrPage(),
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطا')));
                }
              },
              onSubmitted: (value) {
                AppApi().verifyNumber(
                    number: widget.number, code: pinController.text);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FirstrPage(),
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
