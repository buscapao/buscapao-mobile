import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/root_page.dart';
import 'package:projeto_/screens/register_page.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/theme/text.dart';
import 'package:projeto_/helpers/navigation.dart';
import 'package:projeto_/theme/buttons.dart';
import 'package:projeto_/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.all20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //espaço do topo
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),

              // Logo do aplicativo
              Align(
                alignment: Alignment.center,
                child: Image.asset(Img.logoNameBlue, height: 100),
              ),

              SizedBox(height: 40),

              Text(
                'Busque, compare\ne compre com praticidade.',
                style: AppTextStyles.size18Medium(context),
              ),

              SizedBox(height: 40),

              // Campo de e-mail
              CustomTextField(
                label: 'E-mail',
                hint: 'seuemail@email.com',
                icon: LucideIcons.mail,
                obscureText: false,
                onChanged: (String value) {},
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(height: 20),

              // Campo de senha
              CustomTextField(
                label: 'Senha',
                hint: '**********',
                icon: LucideIcons.lock,
                obscureText: obscureText,
                suffixIcon: obscureText ? LucideIcons.eye : LucideIcons.eyeOff,
                onChanged: (String value) {},
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                iconAction: () => setState(() => obscureText = !obscureText),
                textInputAction: TextInputAction.done,
              ),

              SizedBox(height: 8),

              // Esqueci minha senha
              Align(
                alignment: Alignment.centerRight,
                child: SkipButton(
                  text: 'Esqueci minha senha',
                  onPressed: () {
                    _showModal(context);
                  },
                ),
              ),

              SizedBox(height: 30),

              // Botão Entrar
              PrimaryButton(
                onPressed: () => Navigation.replaceCurrent(context, RootPage()),
                text: 'Entrar',
                heigh: 50,
                width: double.infinity,
              ),

              SizedBox(height: 10),

              Align(
                alignment: Alignment.center,
                child: Text(
                  'ou',
                  style: AppTextStyles.size14Medium(
                    context,
                  ).copyWith(color: AppColors.grey),
                ),
              ),

              SizedBox(height: 10),

              // Botão Entrar com Google
              SocialButton(
                onPressed: () {},
                text: 'Entrar com Google',
                heigh: 50,
                width: double.infinity,
              ),

              SizedBox(height: 20),

              // Botão Cadastrar
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ainda não possui uma conta?',
                        style: AppTextStyles.size14Medium(
                          context,
                        ).copyWith(color: AppColors.grey),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5),
                      SkipButton(
                        text: 'Cadastre-se',
                        onPressed:
                            () => Navigation.navigateTo(
                              context,
                              const RegisterPage(),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showModal(BuildContext context) {
  final TextEditingController recoveryEmailController = TextEditingController();

  showModalBottomSheet(
    constraints: const BoxConstraints(maxHeight: 350),
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return BottomSheet(
        showDragHandle: true,
        onClosing: () {},
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        builder:
            (context) => Padding(
              padding: AppPadding.all20,
              child: Column(
                children: [
                  SizedBox(height: 20),

                  Text(
                    'Digite o e-mail cadastrado, e enviaremos um link ou código para você.',
                    style: AppTextStyles.size18Bold(context),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 20),

                  SecundaryTextField(
                    label: 'E-mail',
                    hint: 'seuemail@email.com',
                    obscureText: false,
                    onChanged: (String value) {},
                    controller: recoveryEmailController,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerRight,
                    child: SkipButton(
                      text: 'Enviar',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
      );
    },
  );
}
