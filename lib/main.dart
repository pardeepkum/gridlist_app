import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grid_app/app/view/home_view.dart';
import 'app/bindings/number_binding.dart';
import 'app/controller/number_controller.dart';

void main() {
  Get.put(NumberController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Number Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: NumberBinding(),
      home: const HomeView(),
    );
  }
}
