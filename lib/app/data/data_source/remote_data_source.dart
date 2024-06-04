import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dokan/app/data/remote_urls.dart';
import 'package:dokan/app/module/login/model/user_login_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../error/exception.dart';

abstract class RemoteDataSource {
  Future<UserLoginResponseModel> signIn(Map<String, dynamic> body);
  Future<String> userRegister(Map<String, dynamic> body);
  Future<Map<String, dynamic>> postUpdateProfile(
      Map<String, dynamic> body, String token);
}

typedef CallClientMethod = Future<http.Response> Function();

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;
  final _className = 'RemoteDataSourceImpl';

  RemoteDataSourceImpl({required this.client});

  Future<dynamic> callClientWithCatchException(
      CallClientMethod callClientMethod) async {
    try {
      final response = await callClientMethod();
      if (kDebugMode) {
        print("status code : ${response.statusCode}");
        print(response.body);
      }
      return _responseParser(response);
    } on SocketException {
      log('SocketException', name: _className);
      throw const NetworkException(
          'Please check your \nInternet Connection', 10061);
    } on http.ClientException {
      ///503 Service Unavailable
      log('http ClientException', name: _className);
      throw const NetworkException('Service unavailable', 503);
    } on FormatException {
      log('FormatException', name: _className);
      throw const DataFormatException('Data format exception', 422);
    } on InternalServerException {
      log('TimeoutException', name: _className);
      throw const InternalServerException('Request timeout', 500);
    } on TimeoutException {
      log('TimeoutException', name: _className);
      throw const NetworkException('Request timeout', 408);
    }
  }

  @override
  Future<UserLoginResponseModel> signIn(Map<String, dynamic> body) async {
    final headers = {'Accept': 'application/json'};
    final uri = Uri.parse(RemoteUrls.login);

    // var data = jsonEncode(body);

    final clientMethod = client.post(uri, headers: headers, body: body);
    final responseJsonBody =
        await callClientWithCatchException(() => clientMethod);
    if(responseJsonBody["token"] != null){
      return UserLoginResponseModel.fromJson(responseJsonBody);
    } else {
      throw DataNotFoundException(responseJsonBody["message"],201);
    }
  }

  @override
  Future<String> userRegister(Map<String, dynamic> body) async {
    final headers = {'Accept': 'application/json','Content-Type': 'application/json'};
    final uri = Uri.parse(RemoteUrls.register);
    var data = jsonEncode(body);
    if (kDebugMode) {
      print(data);
    }
    final clientMethod = client.post(uri, headers: headers, body: data);
    final responseJsonBody =
        await callClientWithCatchException(() => clientMethod);
    if (responseJsonBody["code"] == 200) {
      Get.snackbar('Message', responseJsonBody["message"]);
      return responseJsonBody["message"];
    } else {
      final errorMsg = responseJsonBody["message"].toString();
      throw UnauthorisedException(errorMsg, 201);
    }
  }

  @override
  Future<Map<String, dynamic>> postUpdateProfile(
      Map<String, dynamic> body, String token) async {
    final headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    final uri = Uri.parse(RemoteUrls.profileUpdate);

    final clientMethod = client.post(uri, headers: headers, body: body);
    final responseJsonBody =
    await callClientWithCatchException(() => clientMethod);
    if (responseJsonBody["success"] == false) {
      final errorMsg = responseJsonBody["data"].toString();
      throw UnauthorisedException(errorMsg, 401);
    } else {
      return responseJsonBody;
    }
  }


  dynamic _responseParser(http.Response response) {
    if (kDebugMode) {
      print(
        "(((((((((((((((parse json data m (${response.request?.url}))))))))))))))))");
    }
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        final errorMsg = parsingDoseNotExist(response.body);
        throw BadRequestException(errorMsg, 400);
      case 401:
        final errorMsg = parsingDoseNotExist(response.body);
        throw UnauthorisedException(errorMsg, 401);
      case 402:
        final errorMsg = parsingDoseNotExist(response.body);
        throw UnauthorisedException(errorMsg, 402);
      case 403:
        final errorMsg = parsingDoseNotExist(response.body);
        throw UnauthorisedException(errorMsg, 403);
      case 404:
        throw const UnauthorisedException('Request not found', 404);
      case 405:
        throw const UnauthorisedException('Method not allowed', 405);
      case 408:

        ///408 Request Timeout
        throw const NetworkException('Request timeout', 408);
      case 415:

        /// 415 Unsupported Media Type
        throw const DataFormatException('Data format exception');

      case 422:

        ///Unprocessable Entity
        final errorMsg = parsingError(response.body);
        throw InvalidInputException(errorMsg, 422);
      case 500:

        ///500 Internal Server Error
        throw const InternalServerException('Internal server error', 500);

      default:
        throw FetchDataException(
            'Error occurred while communication with Server',
            response.statusCode);
    }
  }

  String parsingError(String body) {
    final errorsMap = json.decode(body);
    try {
      if (errorsMap['errors'] != null) {
        final errors = errorsMap['errors'] as Map;
        final firstErrorMsg = errors.values.first;
        if (firstErrorMsg is List) return firstErrorMsg.first;
        return firstErrorMsg.toString();
      }
      if (errorsMap['message'] != null) {
        return errorsMap['message'];
      }
    } catch (e) {
      log(e.toString(), name: _className);
    }
    return 'Unknown error';
  }

  String parsingDoseNotExist(String body) {
    final errorsMap = json.decode(body);
    try {
      if (errorsMap['notification'] != null) {
        return errorsMap['notification'];
      }
      if (errorsMap['message'] != null) {
        return errorsMap['message'];
      }
    } catch (e) {
      log(e.toString(), name: _className);
    }
    return 'Credentials does not match';
  }

}
