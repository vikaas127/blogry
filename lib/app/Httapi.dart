import 'dart:convert';


import 'package:http/http.dart' as http;

import 'appConstant.dart';

class Httpblogry extends AppConstants {
  //final String base = 'https://meo.co.in/meoApiPro/konnectBusiness_v4/index.php/';
  final String base = 'http://13.55.148.125/api/';

  Map<String, String> headers = {"Content-type": "application/json"};
  // ignore: non_constant_identifier_names
  Future<String> Signinapi(String Username,String Email) async {
    Map params = Map<String, dynamic>();
    params['username'] = "BUPENDRA";
    params['name'] = "BUPENDRA@123";
    params['email'] = "bupendra12@gmail.com";
    params['type'] = 1;
    params['social_id'] = "password";
    final http.Response response = await http.post(

      Uri.parse('${base}signup'),headers: headers,
      body: jsonEncode(params),
    );

    print('Response Body ${response.body}');
    return response.body;
  }





}