import 'package:flutter/material.dart';

import 'package:mobile_challenge/app/app.dart';
import 'package:mobile_challenge/core/services/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const MyApp());
}
