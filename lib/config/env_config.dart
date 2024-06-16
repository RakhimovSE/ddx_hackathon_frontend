import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    if (kReleaseMode) {
      await dotenv.load(fileName: ".env.release");
    } else {
      await dotenv.load(fileName: ".env.debug");
    }
  }
}
