import 'package:exam_api_integration/controller/detailscreencontroller.dart';
import 'package:exam_api_integration/controller/homescreencontroller.dart';
import 'package:exam_api_integration/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create:(context) => Homescreencontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => (DetailsController()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homescreen(),
      ),
    );
  }
}
