import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FirstrPage extends StatefulWidget {
  const FirstrPage({super.key});

  @override
  State<FirstrPage> createState() => _FirstrPageState();
}

class _FirstrPageState extends State<FirstrPage> {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  String? mobile;
  String? token;
  void getUser() async {
    mobile = await storage.read(key: 'mobile');
    token = await storage.read(key: 'token');
    setState(() {
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
      print(mobile);
      print(token);
    });
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 150,
              height: 300,
              color: Colors.black,
              child: Column(
                children: [
                  Text(
                    'token : $token',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'mobile : $mobile',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
