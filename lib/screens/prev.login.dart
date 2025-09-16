import 'package:flutter/material.dart';
import 'package:projeto_/helpers/navigation.dart';
import 'package:projeto_/screens/login_page.dart';
import 'package:projeto_/screens/register_page.dart';
import 'package:projeto_/theme/img.dart';

class PrevLogin extends StatelessWidget {
  const PrevLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Img.prevlogin),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Image(image: AssetImage(Img.logoNameBlue), height: 80),

              Spacer(),
              ElevatedButton(
                onPressed: () => Navigation.replaceCurrent(context, LoginPage()),
                child: Text('Entrar'),
              ),

              SizedBox(height: 20),

              OutlinedButton(
                onPressed: () => Navigation.navigateTo(context, RegisterPage()),
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
