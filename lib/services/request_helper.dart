import 'package:flutter/material.dart';

class RequestHelper {
  static Map<String, String> basicHeader() {
    return {
      "accept": "aplication/json",
      "content-type": "application/json",
    };
  }
}
