import 'package:flutter/material.dart';
import 'package:login_page/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink.withOpacity(0.2),
          titleTextStyle: TextStyle(color: Colors.red, fontSize: 20.0),
        ),
      ),
      home: const LoginPage(title: 'My App'),
    );
  }
}
