import 'package:projeto_/helpers/custom_future_builder.dart';

/// Modelo de dados do usuário Pessoa Física
class UserModelFisica {
  String? nome;
  String? cpf;
  String? email;
  String? ddd;
  String? telefone;
  String? dataNascimento;
  String? password;
  String? confirmPassword;
  String? genero;
  String? tipoUsuario;

  /// Validação da senha com os critérios necessários
  Map<String, bool> validatePassword(String value) {
    return {
      'Mínimo de 8 caracteres': value.length >= 8,
      'Pelo menos uma letra maiúscula': RegExp(r'[A-Z]').hasMatch(value),
      'Pelo menos uma letra minúscula': RegExp(r'[a-z]').hasMatch(value),
      'Pelo menos um número': RegExp(r'\d').hasMatch(value),
      'Pelo menos um caractere especial': RegExp(r'[@!_-]').hasMatch(value),
    };
  }

  /// Validação da confirmação de senha
  String? validateConfirmPassword(String value) {
    if (value.isNotEmpty && value != password) {
      return 'As senhas não coincidem.';
    }
    return null;
  }
}

/// Service responsável pela lógica de negócio do cadastro de pessoa física.
class CadastroFisicaService {
  /// Valida os campos obrigatórios do formulário.
  String? validarCamposObrigatorios(
    UserModelFisica fisica,
    Map<String, String> fields,
  ) {
    for (var entry in fields.entries) {
      if (entry.value.isEmpty) {
        return 'O campo ${entry.key} não pode estar vazio.';
      }
    }

    if (fisica.tipoUsuario == null || fisica.tipoUsuario!.isEmpty) {
      return 'Selecione o tipo de usuário.';
    }

    return null;
  }

  /// Valida se o formulário está completo e válido.
  bool validarFormulario(String passwordError, String confirmPasswordError) {
    return passwordError.isEmpty && confirmPasswordError.isEmpty;
  }

  /// Valida formato do CPF.
  bool validarCPF(String cpf) {
    final cpfLimpo = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    return cpfLimpo.length == 11;
  }

  /// Valida formato do email.
  bool validarEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  /// Valida formato do telefone.
  bool validarTelefone(String telefone) {
    final telefoneLimpo = telefone.replaceAll(RegExp(r'[^0-9]'), '');
    return telefoneLimpo.length >= 8 && telefoneLimpo.length <= 11;
  }

  /// Valida data de nascimento (deve ser maior de idade).
  bool validarDataNascimento(String dataNascimento) {
    try {
      final data = DateTime.parse(dataNascimento);
      final hoje = DateTime.now();
      final idade = hoje.year - data.year;

      if (hoje.month < data.month ||
          (hoje.month == data.month && hoje.day < data.day)) {
        return (idade - 1) >= 18;
      }

      return idade >= 18;
    } catch (e) {
      return false;
    }
  }

  /// Monta o body da requisição para cadastro.
  Map<String, dynamic> montarBodyCadastro(UserModelFisica fisica) {
    return {
      "tipo": "PF",
      "cpf": fisica.cpf,
      "cnpj": null,
      "nome_razaosocial": fisica.nome,
      "apelido_nomefantasia": fisica.nome,
      "email": fisica.email,
      "ddd_movel": fisica.ddd,
      "tel_movel": fisica.telefone,
      "data_cadastro": DateTime.now().toIso8601String(),
      "ativo": true,
      "senha": fisica.password,
      "tipo_usuario": fisica.tipoUsuario ?? '',
    };
  }

  //Realiza o cadastro da pessoa física na API.
  Future<void> cadastrarFisica(UserModelFisica fisica) async {
    final body = montarBodyCadastro(fisica);

    await ApiService.postRequest(
      endpoint: '',
      body: body,
      onSuccess: (response) {
        print("✅ Cadastro realizado com sucesso!");
        print("🔹 Resposta: $response");
      },
      onError: (error) {
        print("❌ Erro ao cadastrar: $error");
        throw Exception('Erro ao cadastrar: $error');
      },
    );
  }

  /// Valida todos os dados antes do cadastro.
  String? validarDadosCompletos(UserModelFisica fisica) {
    if (fisica.cpf != null && !validarCPF(fisica.cpf!)) {
      return 'CPF inválido';
    }

    if (fisica.email != null && !validarEmail(fisica.email!)) {
      return 'Email inválido';
    }

    if (fisica.telefone != null && !validarTelefone(fisica.telefone!)) {
      return 'Telefone inválido';
    }

    if (fisica.dataNascimento != null &&
        !validarDataNascimento(fisica.dataNascimento!)) {
      return 'Data de nascimento inválida ou menor de idade';
    }

    return null;
  }

  /// Formata CPF para exibição (000.000.000-00).
  String formatarCPF(String cpf) {
    final cpfLimpo = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    if (cpfLimpo.length == 11) {
      return '${cpfLimpo.substring(0, 3)}.${cpfLimpo.substring(3, 6)}.${cpfLimpo.substring(6, 9)}-${cpfLimpo.substring(9)}';
    }
    return cpf;
  }

  /// Formata telefone para exibição ((00) 00000-0000).
  String formatarTelefone(String telefone, String ddd) {
    final telefoneLimpo = telefone.replaceAll(RegExp(r'[^0-9]'), '');
    if (telefoneLimpo.length == 9) {
      return '($ddd) ${telefoneLimpo.substring(0, 5)}-${telefoneLimpo.substring(5)}';
    } else if (telefoneLimpo.length == 8) {
      return '($ddd) ${telefoneLimpo.substring(0, 4)}-${telefoneLimpo.substring(4)}';
    }
    return '($ddd) $telefone';
  }
}
