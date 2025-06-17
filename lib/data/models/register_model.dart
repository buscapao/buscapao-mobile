class Empresa {
  String? nome;
  String? telefone;
  String? email;
  String? senha;
  String? confirmarSenha;

  Empresa({
    this.nome,
    this.telefone,
    this.email,
    this.senha,
    this.confirmarSenha,
  });

  Map<String, bool> validatePassword(String value) {
    return {
      'hasMinLength': value.length >= 8,
      'hasUpperCase': RegExp(r'[A-Z]').hasMatch(value),
      'hasLowerCase': RegExp(r'[a-z]').hasMatch(value),
      'hasNumber': RegExp(r'\d').hasMatch(value),
      'hasSpecialChar': RegExp(r'[@!_-]').hasMatch(value),
    };
  }

  String? validateConfirmPassword(String value) {
    if (value.isNotEmpty && value != senha) {
      return 'As senhas não coincidem.';
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {
      'Razão Social': nome,
      'Telefone': telefone,
      'E-mail': email,
      'Senha': senha,
    };
  }
}
