import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppApi {
  Dio dio = Dio();

  sendNumber({required String number}) async {
    Response res =
        await dio.post('https://panel.bigbaar.com/api/v1/appLogin', data: {
      'mobile': number,
    });
    print('hhhhhhhhhhhhhhhh');
    print('hhhhhhhhhhhhhhhh');
    print('hhhhhhhhhhhhhhhh');
    print(res);
  }

  verifyNumber({required String number, required String code}) async {
 
    Response res =  await dio.post('https://panel.bigbaar.com/api/v1/appVerifyOtp', 
        data: {
      'mobile': number,
      'otp': code,
    });
    
    FlutterSecureStorage storage = const FlutterSecureStorage();

 await storage.write(key: 'token', value: res.data['data']['token']);
 await storage.write(key: 'mobile', value: res.data['data']['mobile']);
    print('eeeeeeeeeeeeeeee');
    print('eeeeeeeeeeeeeeee');
    print('eeeeeeeeeeeeeeee');
    print(res.data);
    return res.data['success'];
  }
}
