import 'dart:convert';

import 'package:blogry/app/appConstant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'appConstant.dart';


class ApiClient extends AppConstants {
  String tokenf ="Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdmF0YXIiOiIvZGVmYXVsdC91c2VyLnBuZyIsInNlbGVjdGVkX2NhdGVnb3J5IjpbXSwiYmxvZ3MiOltdLCJfaWQiOiI2MDlhMmUwZTBkMmJkOTRhNGRhNGJkNzkiLCJ1c2VybmFtZSI6ImZhaXNhbCIsIm5hbWUiOiJmYWlzYWwiLCJlbWFpbCI6ImFmQDEyMy5jb20iLCJ0eXBlIjpmYWxzZSwic29jaWFsX2lkIjoiYXNkZiIsImNyZWF0ZWRBdCI6IjIwMjEtMDUtMTFUMDc6MTE6MTAuODMzWiIsInVwZGF0ZWRBdCI6IjIwMjEtMDUtMTFUMDc6MTE6MTAuODMzWiIsIl9fdiI6MCwiaWF0IjoxNjIwODg1OTkxLCJleHAiOjE2MjA4ODk1OTF9.Hoiyeofa_dHMj__JaGCKUa-q5mXUWcr-khK71F6hvWE";
  //String token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdmF0YXIiOiIvZGVmYXVsdC91c2VyLnBuZyIsIl9pZCI6IjYwOTY0MzcyZjg0MzM3MTAzOTJlMjM4NSIsInVzZXJuYW1lIjoiQlVQRU5EUkEiLCJuYW1lIjoiQlVQRU5EUkFAMTIzIiwiZW1haWwiOiJidXBlbmRyYTEyQDEyMy5jb20iLCJ0eXBlIjp0cnVlLCJzb2NpYWxfaWQiOiJwYXNzd29yZCIsImNyZWF0ZWRBdCI6IjIwMjEtMDUtMDhUMDc6NTM6MjIuMDk3WiIsInVwZGF0ZWRBdCI6IjIwMjEtMDUtMDhUMDc6NTM6MjIuMDk3WiIsIl9fdiI6MCwiaWF0IjoxNjIwNDY4NDk0LCJleHAiOjE2MjA0NzIwOTR9.e57PdboEKrNjW8sLl-ZS2bRHalZFgzadBoRG_jjwtf8";
  Dio getInstanceJson() {
    return Dio(
      BaseOptions(

        headers: {'Content-type': 'application/json; charset=utf-8',
        'Accept':'application/json'},
        baseUrl: 'http://13.55.148.125/api/',
        connectTimeout: 90 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }
  Dio getInstanceJsontoken() {
    return Dio(
      BaseOptions(

        headers: {'Content-type': 'application/json; charset=utf-8',},
        baseUrl: 'http://13.55.148.125/api/',
        connectTimeout: 90 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }
  Dio getInstanceForm() {
    return Dio(
      BaseOptions(

        headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdmF0YXIiOiIvZGVmYXVsdC91c2VyLnBuZyIsImJsb2dzIjpbXSwiX2lkIjoiNjA5YTJlMGUwZDJiZDk0YTRkYTRiZDc5IiwidXNlcm5hbWUiOiJmYWlzYWwiLCJuYW1lIjoiZmFpc2FsIiwiZW1haWwiOiJhZkAxMjMuY29tIiwidHlwZSI6ZmFsc2UsInNvY2lhbF9pZCI6ImFzZGYiLCJjcmVhdGVkQXQiOiIyMDIxLTA1LTExVDA3OjExOjEwLjgzM1oiLCJ1cGRhdGVkQXQiOiIyMDIxLTA1LTExVDA3OjExOjEwLjgzM1oiLCJfX3YiOjAsImlhdCI6MTYyMDcxOTMxMSwiZXhwIjoxNjIwNzIyOTExfQ.T02TW-KtiKcYafBXbcKL9NIOEZTnP45n_N8UUWn5Em0',},

        baseUrl: 'http://13.55.148.125/api/',
        connectTimeout: 90 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }
  Dio getInstanceformauth() {
    var authToken = base64.encode(utf8.encode("username" + ":" + "password"));
    print(authToken);
    return Dio(
      BaseOptions(

        headers: {'Authorization': 'Basic dGVzdGNsaWVudDp0ZXN0c2VjcmV0', 'Content-type': 'application/x-www-form-urlencoded; charset=utf-8'},

        baseUrl: 'http://13.55.148.125/api/',
        connectTimeout: 90 * 1000,
        receiveTimeout: 60 * 1000,
      ),
    );
  }
  // Signup
  // ignore: non_constant_identifier_names
  Future<Response<Map>> userSignin(String LEmail, int type) async {
    Map params = Map<String, dynamic>();

    params['type'] = type;
    params['email'] = LEmail;
    params['social_id'] = LEmail;

    return await getInstanceJson().post('signin', data: params);
  }
 // login

  // ignore: non_constant_identifier_names
  Future<Response<Map>> userSignUp(String Username,String Email,int type   ) async {
    Map params = Map<String, dynamic>();
    params['username'] = Username;
    params['name'] = Username;
    params['email'] = Email;
    params['type'] = type;
    params['social_id'] = Email;

    return await getInstanceJson().post('signup', data: params);
  }
  // ignore: non_constant_identifier_names
  Future<Response<Map>> verifyOTP(String OTP,String Email) async {
    Map params = Map<String, dynamic>();

    params['email'] = Email;
    params['otp'] = OTP;


    return await getInstanceJson().post('verify_otp', data: params);
  }
  // ignore: non_constant_identifier_names
  Future<Response<Map<dynamic, dynamic>>> CatograryList( String token) async {


    return await getInstanceForm().get('category');
  }
  // ignore: non_constant_identifier_names
  Future<Response<Map<dynamic, dynamic>>> CatograrySelectionList( String Token,List<String> token) async {
    Map params = Map<String, dynamic>();
params['selected_category']=token;


    return await getInstanceJsontoken().post('category',data:params,options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }
//category
  Future<Response<Map>> userSearchBlog(@required String Token,String Keyword,int  page, int limit ) async {
    Map params = Map<String, dynamic>();
    params['keyword'] = Keyword;
    params['page'] = page;
    params['limit'] = limit;


    return await getInstanceJson().post('search', data: params,options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }

 //UserProfile
  Future<Response<Map>> userprofile(@required String Token ) async {
    Map params = Map<String, dynamic>();
 //   params['username'] = Username;


    return await getInstanceJson().get('user',options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }
  Future<Response<Map>> userupdatedata(@required String Token, String bio) async {
    Map params = Map<String, dynamic>();
    params['bio'] = bio;


    return await getInstanceJson().post('user', data: params,options: Options(headers: {'Authorization':tokenf}) );
  }





  //blog
  Future<Response<Map>> updateblog(@required String Token,@required String blogid,String title,Map<double,String> content ) async {
    Map params = Map<String, dynamic>();
    params['title'] = title;
    params['content'] = content;

    return await getInstanceJson().put('blog/${blogid}', data: params,options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }
  Future<Response<dynamic>> getblog(@required String Token, @required String blogid) async {

    return await getInstanceJson().get('blog/${blogid}',options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }
  Future<Response<Map>> addnewBlog( @required String Token ,@required String title,@required String content) async {
    Map params = Map<String, dynamic>();
      params['title'] = title;
      params['content'] = content;


    return await getInstanceJson().post('blog', data: params,options: Options(headers: {'Authorization':'Bearer $Token'}) );
  }


}
