import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:projeto_/helpers/mask.dart';
import 'package:projeto_/root_page.dart';
import 'package:projeto_/theme/colors.dart';
import 'package:projeto_/theme/img.dart';
import 'package:projeto_/theme/padding.dart';
import 'package:projeto_/helpers/navigation.dart';
import 'package:projeto_/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  final bool showBackButton;

  const RegisterPage({super.key, this.showBackButton = true});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool obscureText = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    cpfController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        automaticallyImplyLeading: widget.showBackButton,
        iconTheme: const IconThemeData(color: AppColors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.all20,
          child: Column(
            children: [
              const SizedBox(height: 30),

              // Logo do aplicativo
              Align(
                alignment: Alignment.center,
                child: Image.asset(Img.logoNameBlue, height: 100),
              ),

              const SizedBox(height: 60),

              // Campo de nome
              CustomTextField(
                label: 'Nome',
                hint: 'Seu Nome Completo',
                icon: LucideIcons.userRound500,
                obscureText: false,
                onChanged: (String value) {},
                controller: nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 20),

              // Campo de email
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

              const SizedBox(height: 20),

              // Campo de cpf
              CustomTextField(
                inputFormatters: [CpfCnpjInputFormatter()],
                label: 'CPF',
                hint: '999.999.999-99',
                icon: LucideIcons.dock500,
                obscureText: false,
                onChanged: (String value) {},
                controller: cpfController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 20),

              // Campo de telefone
              CustomTextField(
                inputFormatters: [PhoneInputFormatter()],
                label: 'Telefone',
                hint: '(99) 99999-9999',
                icon: LucideIcons.phoneCall,
                obscureText: false,
                onChanged: (String value) {},
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 20),

              // Campo de senha
              CustomTextField(
                label: 'Senha',
                hint: '********',
                icon: LucideIcons.lock,
                obscureText: obscureText,
                suffixIcon: LucideIcons.eye,
                iconAction: () => setState(() => obscureText = !obscureText),
                onChanged: (String value) {},
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 20),

              // Campo de confirmação de senha
              CustomTextField(
                label: 'Confirmar Senha',
                hint: '********',
                icon: LucideIcons.lock,
                obscureText: obscureText,
                suffixIcon: LucideIcons.eye,
                iconAction: () => setState(() => obscureText = !obscureText),
                onChanged: (String value) {},
                controller: passwordConfirmController,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
              ),

              const SizedBox(height: 30),

              // Botão cadastrar
              ElevatedButton(
                onPressed:
                    () => Navigation.navigateTo(context, const RootPage()),
                child: const Text('Cadastrar'),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
