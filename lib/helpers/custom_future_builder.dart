import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_/data/models/user_session.dart';
import 'package:projeto_/data/url/url_repository.dart';

class CustomFuturebuild<T> extends StatelessWidget {
  const CustomFuturebuild({
    super.key,
    required this.futuro,
    required this.completo,
    this.dataInicial,
    this.erro,
    this.carregando,
    this.vazio,
  });

  final Future<T> futuro;
  final T? dataInicial;

  final Widget Function(BuildContext context, T data) completo;
  final Widget Function(BuildContext context, Object? error)? erro;
  final Widget Function(BuildContext context)? carregando;
  final Widget Function(BuildContext context)? vazio;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: futuro,
      initialData: dataInicial,
      builder: (context, snapshot) {
        final status = snapshot.connectionState;

        // 🔴 Estado de erro
        if (snapshot.hasError) {
          return erro?.call(context, snapshot.error) ??
              Center(child: Text('Ocorreu um erro'));
        }

        // 🟡 Estado de carregando
        if (status == ConnectionState.waiting) {
          return carregando?.call(context) ?? const CircularProgressIndicator();
        }

        // 🟢 Estado de completo
        if (status == ConnectionState.done) {
          if (snapshot.hasData) {
            return completo(context, snapshot.data as T);
          } else {
            return vazio?.call(context) ??
                Center(child: Text('Nenhum dado encontrado.'));
          }
        }

        return const SizedBox();
      },
    );
  }
}

class ApiService {
  static Future<T> _makeRequest<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    required Future<http.Response> Function(
      Uri, {
      Map<String, String>? headers,
      Object? body,
    })
    method,
    Map<String, String>? headers,
    Function(dynamic)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      // 🔵 Construir URL completa a partir do endpoint
      final url = UrlServer.buildUrl(endpoint);

      // 🔵 Definir headers padrão
      final finalHeaders = {
        'Content-Type': 'application/json',
        if (headers != null) ...headers, // Adiciona headers customizados
      };

      // 🟢 Fazer a requisição HTTP
      final response = await method(
        Uri.parse(url),
        headers: finalHeaders,
        body: jsonEncode(body),
      );

      // 🔵 Logs para debug
      print("🔹 URL: $url");
      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Body enviado: ${jsonEncode(body)}");
      print("🔹 Resposta: ${response.body}");

      try {
        // 🟢 Tentar decodificar o JSON da resposta
        final responseBody = jsonDecode(response.body);

        // 🟢 Status 200 ou 201 (sucesso)
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Ação realizada com sucesso!");
          if (onSuccess != null) {
            return onSuccess(responseBody) as T; // Chamar callback de sucesso
          }
          return responseBody as T; // Retornar o corpo da resposta diretamente
        }
        // 🔴 Erro na requisição
        else {
          print("Erro: ${response.statusCode}");
          if (onError != null) {
            return onError(responseBody['message'] ?? response.body)
                as T; // Chamar callback de erro
          }
          return "Erro: ${response.statusCode}"
              as T; // Retornar mensagem de erro padrão
        }
      }
      // 🔴 Erro ao decodificar JSON
      on FormatException catch (e) {
        print("Erro ao decodificar JSON: $e");
        if (onError != null) {
          return onError("Erro ao decodificar resposta: $e") as T;
        }
        return "Erro ao decodificar resposta: $e" as T;
      }
    }
    // 🔴 Erro de conexão (ClientException)
    on http.ClientException catch (e) {
      print("Erro de rede: $e");
      if (onError != null) {
        return onError(e.toString()) as T;
      }
      return "Erro de rede: $e" as T;
    }
    // 🔴 Erro genérico
    catch (e) {
      print("Erro na requisição: $e");
      if (onError != null) {
        return onError(e.toString()) as T;
      }
      return "Erro na requisição: $e" as T;
    }
  }

  // 🟡 Método para requisições POST
  static Future<T> postRequest<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Function(dynamic)? onSuccess,
    Function(String)? onError,
  }) async {
    return _makeRequest<T>(
      endpoint: endpoint,
      body: body,
      method: http.post,
      headers: headers,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  // 🟡 Método para requisições PUT
  static Future<T> putRequest<T>({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    Function(dynamic)? onSuccess,
    Function(String)? onError,
  }) async {
    return _makeRequest<T>(
      endpoint: endpoint,
      body: body,
      method: http.put,
      headers: headers,
      onSuccess: onSuccess,
      onError: onError,
    );
  }
}

// 🔵 Serviço de requisições HTTP com token
class ApiTokenService {
  // 🔵 Método genérico para requisições GET
  static Future<T> getRequest<T>({
    required String endpoint,
    Map<String, String>? headers,
    bool useToken = false,
    Function(dynamic)? onSuccess,
    Function(String)? onError,
  }) async {
    try {
      // 🔸 Monta a URL completa
      final url = UrlServer.buildUrl(endpoint);

      // 🔸 Headers padrão
      final finalHeaders = {
        'Content-Type': 'application/json',
        if (headers != null) ...headers,
        if (useToken) ...{'Authorization': 'Bearer ${UserSession().token}'},
      };

      // 🟢 Faz a requisição GET
      final response = await http.get(Uri.parse(url), headers: finalHeaders);

      // 🔵 Logs
      print("🔹 URL: $url");
      print("🔹 Status Code: ${response.statusCode}");
      print("🔹 Resposta: ${response.body}");

      try {
        final responseBody = jsonDecode(response.body);

        // 🟢 Se sucesso
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("Requisição GET bem-sucedida!");
          if (onSuccess != null) {
            return onSuccess(responseBody) as T;
          }
          return responseBody as T;
        }
        // 🔴 Se erro HTTP
        else {
          final errorMessage =
              responseBody['message'] ?? 'Erro: ${response.statusCode}';
          print("Erro na requisição GET: $errorMessage");

          if (onError != null) {
            return onError(errorMessage) as T;
          }

          return 'Erro: ${response.statusCode}' as T;
        }
      }
      // 🔴 Erro ao decodificar JSON
      on FormatException catch (e) {
        final errorMsg = "Erro ao decodificar resposta: $e";
        print(errorMsg);

        if (onError != null) {
          return onError(errorMsg) as T;
        }

        return errorMsg as T;
      }
    }
    // 🔴 Erro de rede
    on http.ClientException catch (e) {
      final errorMsg = "Erro de rede: $e";
      print(errorMsg);

      if (onError != null) {
        return onError(errorMsg) as T;
      }

      return errorMsg as T;
    }
    // 🔴 Erro genérico
    catch (e) {
      final errorMsg = "Erro na requisição: $e";
      print(errorMsg);

      if (onError != null) {
        return onError(errorMsg) as T;
      }

      return errorMsg as T;
    }
  }
}
