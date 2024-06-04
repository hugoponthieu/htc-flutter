import 'package:flutter/material.dart';
import 'package:htc_flutter/config/configuration.dart';
import 'package:htc_flutter/my_app.dart';

void main() {
  const appEnv = String.fromEnvironment("APP_ENV");
  Configuration().init(appEnv);
  runApp(const MyApp());
}
