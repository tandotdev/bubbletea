import 'package:flutter/material.dart';
import 'package:flutter_test_22/Models/shop.dart';
import 'package:flutter_test_22/Pages/home_paga.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> BubbleTeaShop(),
      builder:(context, child ) =>  MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home :HomePage(),
   ),
  );
 }
}
