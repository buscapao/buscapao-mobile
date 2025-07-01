class UrlServer {
  // troca pra false se for pra produção
  static const bool testeOn = true;

  static const String _baseUrlTeste = 'https://api.buscapao.com';
  static const String _baseUrlProducao =
      'https://api.buscapao.com'; // lembrar de arrumar

  static String get baseUrl => testeOn ? _baseUrlTeste : _baseUrlProducao;

  static String buildUrl(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    if (!endpoint.startsWith('/')) {
      endpoint = '/$endpoint';
    }

    Uri uri = Uri.parse('$baseUrl$endpoint');

    if (queryParameters != null && queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return uri.toString();
  }
}
