import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp() as Widget);
}

class MyApp extends StatelessWidget {
  const MyApp({key? key}) : super(key: key);
  @override
  Widget buid(BuildContext context) {
    return MaterialApp(
      title: 'Satyam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('yourBMI'),
      ),
      body: Text('Hello world'),
    );
  }
}
