import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'Hello ${widget.title} 😍',
          style: TextStyle(color: Colors.orange, fontSize: 26.0),
        ),
      ),
    );
  }
}
