class LoginModel {
  static final LoginModel _instance = LoginModel._internal();

  factory LoginModel() => _instance;

  LoginModel._internal();

  int? idUsuarioAplicativo;
  String? identificacao;
  String? email;
  String? senha;
  DateTime? dataCriacao;
  bool? ativo;
  int? idPessoa;
  bool isLoggedIn = false;
  String? token = '';

  void setUserData(Map<String, dynamic> userData) {
    idUsuarioAplicativo = userData['idusuarioaplicativo'];
    identificacao = userData['identificacao'];
    email = userData['email'];
    senha = userData['senha'];
    dataCriacao = DateTime.parse(userData['data_criacao']);
    ativo = userData['ativo'];
    idPessoa = userData['idpessoa'];
    isLoggedIn = true;
  }

  void clearSession() {
    idUsuarioAplicativo = null;
    identificacao = null;
    email = null;
    senha = null;
    dataCriacao = null;
    ativo = null;
    idPessoa = null;
    isLoggedIn = false;
  }

  void setToken(String? header) {
    token = header;
  }
}