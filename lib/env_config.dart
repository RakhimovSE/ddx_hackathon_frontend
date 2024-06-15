import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static Future<void> load() async {
    await dotenv.load(fileName: ".env");

    if (kReleaseMode) {
      await dotenv.load(fileName: ".env.release", mergeWith: dotenv.env);
    } else {
      await dotenv.load(fileName: ".env.debug", mergeWith: dotenv.env);
    }
  }
}
