import 'package:flutter/foundation.dart';

void printf(value) {
  if (kDebugMode) {
    debugPrint(value.toString(), wrapWidth: 1024);
  }
}
