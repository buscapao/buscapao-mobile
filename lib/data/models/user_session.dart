/// Classe responsável por armazenar os dados da sessão do usuário
class UserSession {
  // Instância única da classe (padrão Singleton)
  static final UserSession _instance = UserSession._internal();

  /// Fábrica que retorna sempre a mesma instância
  factory UserSession() => _instance;

  /// Construtor interno privado (impede criação de múltiplas instâncias)
  UserSession._internal();

  // Dados da sessão do usuário

  int? idUsuarioAplicativo;
  String? identificacao;
  String? email;
  String? senha;
  DateTime? dataCriacao;
  bool? ativo;
  int? idPessoa;
  int? idConstrutora;
  int? idImobiliaria;

  /// Indica se o usuário está logado ou não
  bool isLoggedIn = false;

  /// Token de autenticação da API (ex: Bearer Token)
  String? token = '';

  /// Define os dados do usuário logado a partir de um Map recebido da API
  void setUserData(Map<String, dynamic> userData) {
    idUsuarioAplicativo = userData['idusuarioaplicativo'];
    identificacao = userData['identificacao'];
    email = userData['email'];
    senha = userData['senha'];
    dataCriacao = DateTime.parse(userData['data_criacao']);
    ativo = userData['ativo'];
    idPessoa = userData['idpessoa'];
    idConstrutora = userData['idconstrutora'];
    idImobiliaria = userData['idimobiliaria'];
    isLoggedIn = true; // Marca como logado
  }

  /// Limpa todos os dados da sessão (logout)
  void clearSession() {
    idUsuarioAplicativo = null;
    identificacao = null;
    email = null;
    senha = null;
    dataCriacao = null;
    ativo = null;
    idPessoa = null;
    idConstrutora = null;
    idImobiliaria = null;
    isLoggedIn = false;
  }

  /// Define o token de autenticação
  void setToken(String? header) {
    token = header;
  }
}
