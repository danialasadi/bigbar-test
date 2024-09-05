import 'package:bigbar/dioapi.dart';
import 'package:bigbar/smspage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextFormField(
          onFieldSubmitted: (value) {
            AppApi().sendNumber(number: controller.text);
          
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SmsPage(number: controller.text),
            ));
          },
          autocorrect: true,
          controller: controller,
          keyboardType: TextInputType.phone,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600),
          cursorColor: Colors.black,
          textDirection: TextDirection.rtl,
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontSize: 11.5),
            prefixIcon: const Icon(CupertinoIcons.phone_circle_fill),
            prefixIconColor: Colors.black45,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            hintTextDirection: TextDirection.rtl,
            hintText: 'لطفا شماره موبایل خود را وارد کنید',
            hintStyle: const TextStyle(
                color: Colors.black45,
                fontSize: 12.5,
                fontWeight: FontWeight.w600),
            filled: true,
            fillColor: const Color(0XFFF5F5F5),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10)),
          ),
                      ),
                    ),
        ],
      ),
    );
  }
}
