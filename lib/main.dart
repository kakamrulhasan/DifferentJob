import 'package:flutter/material.dart';
import 'package:flutter_application_5/core/routes/route_import_path.dart';
import 'package:flutter_application_5/core/routes/route_name.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: AppRouter.genearateRoute ,
      initialRoute: RouteName.splashscreen,
    );
  }
}
