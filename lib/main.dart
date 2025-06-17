import 'package:flutter/material.dart';
import 'package:projeto_/screens/prev.login.dart';
import 'package:projeto_/theme/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme:  AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          iconTheme: const IconThemeData(color: AppColors.white),
        ),
        useMaterial3: true,
      ),
      home: PrevLogin(),
    );
  }
}
