import 'package:dengun_challenge/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:dengun_challenge/core/injection_container.dart'
    as injection_container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection_container.init();

  runApp(const AppWidget());
}
