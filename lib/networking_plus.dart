library networking_plus;

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:networking_plus/api_response.dart';

class Networking {
  static var baseURL = "";
  static var defaultHeaders = <String, String>{"Content-Type": "application/json"};

  static check() {
    if (baseURL.isEmpty) {
      throw Exception("Base URL can't be empty. Please set base URL 'Networking.baserURL = YOUR REMOTE URL'");
    }
  }

  static Future<ApiResponse> get(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
  }) async {
    check();

    if (query != null && query.isNotEmpty) {
      url += "?";
      query.forEach((key, value) {
        url += "$key=$value&";
      });
      url = url.substring(0, url.length - 1);
    }

    headers ??= <String,String>{};
    defaultHeaders.forEach((key, value) {
      headers![key] = value;
    });

    try {
      var uri = Uri.parse(baseURL + url);
      var data = await http.get(uri, headers: headers);
      print("${data.statusCode}: ${uri.toString()}");
      if (data.statusCode == 200) {
        return Success(data.body);
      } else {
        if (data.body.isEmpty) {
          return Error(data.statusCode, data.reasonPhrase ?? data.body);
        }
        return Error(data.statusCode, data.body);
      }
    } catch (e) {
      print(e);
      return Error(400, e.toString());
    }
  }

  static Future<ApiResponse> post(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    check();

    if (query != null && query.isNotEmpty) {
      url += "?";
      query.forEach((key, value) {
        url += "$key=$value&";
      });
      url = url.substring(0, url.length - 1);
    }

    headers ??= <String,String>{};
    defaultHeaders.forEach((key, value) {
      headers![key] = value;
    });

    try {
      var uri = Uri.parse(baseURL + url);
      var data = await http.post(uri, headers: headers, body: jsonEncode(body));
      print("${data.statusCode}: ${uri.toString()}");
      if (data.statusCode == 200) {
        return Success(data.body);
      } else {
        if (data.body.isEmpty) {
          return Error(data.statusCode, data.reasonPhrase ?? data.body);
        }
        return Error(data.statusCode, data.body);
      }
    } catch (e) {
      print(e);
      return Error(400, e.toString());
    }
  }

  static Future<ApiResponse> put(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    check();

    if (query != null && query.isNotEmpty) {
      url += "?";
      query.forEach((key, value) {
        url += "$key=$value&";
      });
      url = url.substring(0, url.length - 1);
    }

    headers ??= <String,String>{};
    defaultHeaders.forEach((key, value) {
      headers![key] = value;
    });

    try {
      var uri = Uri.parse(baseURL + url);
      var data = await http.put(uri, headers: headers, body: jsonEncode(body));
      print("${data.statusCode}: ${uri.toString()}");
      if (data.statusCode == 200) {
        return Success(data.body);
      } else {
        if (data.body.isEmpty) {
          return Error(data.statusCode, data.reasonPhrase ?? data.body);
        }
        return Error(data.statusCode, data.body);
      }
    } catch (e) {
      print(e);
      return Error(400, e.toString());
    }
  }

  static Future<ApiResponse> delete(
    String url, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    check();

    if (query != null && query.isNotEmpty) {
      url += "?";
      query.forEach((key, value) {
        url += "$key=$value&";
      });
      url = url.substring(0, url.length - 1);
    }

    headers ??= <String,String>{};
    defaultHeaders.forEach((key, value) {
      headers![key] = value;
    });


    try {
      var uri = Uri.parse(baseURL + url);
      var data = await http.delete(uri, headers: headers, body: jsonEncode(body));
      print("${data.statusCode}: ${uri.toString()}");
      if (data.statusCode == 200) {
        return Success(data.body);
      } else {
        if (data.body.isEmpty) {
          return Error(data.statusCode, data.reasonPhrase ?? data.body);
        }
        return Error(data.statusCode, data.body);
      }
    } catch (e) {
      print(e);
      return Error(400, e.toString());
    }
  }
}
