import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConnectionBackendConfig {
  ConnectionBackendConfig() {
    if (dotenv.env['BASE_URL'] == null) {
      throw Exception('BASE_URL is not defined in .env file');
    }
    init();
  }
  String init() {
    return "${dotenv.env['BASE_URL']}";
  }
}
