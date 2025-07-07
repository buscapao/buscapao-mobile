class UrlServer {
  // true = ambiente de testes; false = produção
  static const bool testeOn = true;

  // URL base usada no ambiente de testes
  static const String _baseUrlTeste = 'https://api.buscapao.com';

  // ⚠️ Lembrar de trocar se for diferente
  static const String _baseUrlProducao = 'https://api.buscapao.com';

  // Getter que retorna a URL base correta com base no valor de `testeOn`
  static String get baseUrl => testeOn ? _baseUrlTeste : _baseUrlProducao;

  // Função que monta a URL completa com base no endpoint e parâmetros de query opcionais
  static String buildUrl(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    // Garante que o endpoint sempre começa com uma barra "/"
    if (!endpoint.startsWith('/')) {
      endpoint = '/$endpoint';
    }

    // Monta a URI inicial juntando a baseUrl com o endpoint
    Uri uri = Uri.parse('$baseUrl$endpoint');

    // Se houver parâmetros de query, adiciona eles na URI
    if (queryParameters != null && queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    // Retorna a URL final como string
    return uri.toString();
  }
}
