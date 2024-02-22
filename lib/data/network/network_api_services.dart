import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iskaan_inspections_mobile/data/app_exceptions.dart';
import 'package:iskaan_inspections_mobile/res/globals.dart';

import 'base_api_services.dart';

class NetworkApiServices implements BaseApiServices {
  static const int timeoutDuration = 30;
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'accept': "application/json",
          'Content-Type': "application/json",
        },
      ).timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });
      debugPrint('code: ${response.statusCode}\nbody: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getAuthGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'accept': "application/json",
        'Content-Type': "application/json",
        'authorization': 'Bearer ${Globals().token ?? ""}'
      }).timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });
      responseJson = returnResponse(response);
      debugPrint(
          'get status code: ${response.statusCode}\n body: ${response.body}');
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {
                'accept': "application/json",
                'Content-Type': "application/json",
              },
              body: jsonEncode(data))
          .timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });
      debugPrint('code: ${response.statusCode}\nbody: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    } catch (e) {
      rethrow;
    }

    return responseJson;
  }

  @override
  Future getAuthPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
        Uri.parse(url),
        headers: {
          'accept': "application/json",
          'Content-Type': "application/json",
          'authorization': 'Bearer ${Globals().token}'
        },
        body: jsonEncode(data),
      )
          .timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });
      debugPrint(
          'status code: ${response.statusCode}\n body: ${response.body}');
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPostApiMultipartResponse(
    String url,
    Map<String, dynamic>? data,
    List<http.MultipartFile> files,
  ) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      if (data != null) {
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });
      }
      request.files.addAll(files);

      Map<String, String> headers = {
        "content-type": "multipart/form-data",
        'Accept': 'application/json',
      };
      request.headers.addAll(headers);
      var streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });

      var response = await http.Response.fromStream(streamedResponse);
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  @override
  Future getAuthPostApiMultipartResponse(
    String url,
    Map<String, dynamic>? data,
    List<http.MultipartFile> files,
  ) async {
    dynamic responseJson;
    try {
      var request = http.MultipartRequest("POST", Uri.parse(url));
      if (data != null) {
        data.forEach((key, value) {
          request.fields[key] = value.toString();
        });
      }
      request.files.addAll(files);
      Map<String, String> headers = {
        "content-type": "multipart/form-data",
        'Accept': 'application/json',
        "Authorization": "Bearer ${Globals().token}"
      };
      request.headers.addAll(headers);
      var streamedResponse = await request
          .send()
          .timeout(const Duration(seconds: timeoutDuration), onTimeout: () {
        throw FetchDataException(
            "Connection timeout, please check your internet");
      });
      var response = await http.Response.fromStream(streamedResponse);
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException catch (e) {
      throw FetchDataException(e.toString());
    }
  }

  dynamic returnResponse(http.Response response) {
    final body = json.decode(response.body);
    final statusCode = response.statusCode;
    switch (statusCode) {
      // Add your own status code errors or message
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(body['message']);
      case 401:
        throw UnauthorisedException(body['message']);
      case 404:
        throw NotFoundException(body['message'], 'Requested info not found!');
      default:
        throw FetchDataException(body['message']);
    }
  }
}
