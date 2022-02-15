import 'package:flutter/material.dart';
import 'package:flutter_share/app/app.locator.dart';
import 'package:flutter_share/ui/home/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Share',
      home: HomeView(),
    );
  }
}
