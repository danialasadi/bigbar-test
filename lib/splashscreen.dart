import 'package:bigbar/firstpage.dart';
import 'package:bigbar/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? value;

  tokenChecker() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();

    value = await storage.read(key: 'token');
  }
@override
  void initState() {
      tokenChecker();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    Future.delayed(const Duration(seconds: 3)).whenComplete(
      () {
        if (value == null) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage(),));
        } else {

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FirstrPage(),
          ));

        }
      },
    );

    return const Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                width: 50, height: 50, child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
