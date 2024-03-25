import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mlq/main.dart';
import 'package:mlq/profile.dart';
import 'package:mlq/services/context_utility.dart';
import 'package:uni_links/uni_links.dart';

class UniServices {
  static String _code = "";
  static String get code => _code;
  static bool get hascode => _code.isNotEmpty;

  static void reset() => _code = '';

  static init() async {
    try {
      final Uri? uri = await getInitialUri();
      uriHandler(uri);
    } on PlatformException catch (e) {
      log("Failed to recieve code");
    } on FormatException catch (e) {
      log("Wrong Format code recieved");
    } catch (e) {
      log("Exception $e");
    }

    uriLinkStream.listen((Uri? uri) async {
      uriHandler(uri);
    }, onError: (error) {
      log("OnUriLink Error:  $error");
    });
  }

  static uriHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;

    Map<String, String> param = uri.queryParameters;

    String recievedCode = param['code'] ?? '';

    if (recievedCode == "profile") {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (context) => Profile()));
    } else {
      Navigator.push(ContextUtility.context!,
          MaterialPageRoute(builder: (context) => InitialPage()));
    }
  }
}
