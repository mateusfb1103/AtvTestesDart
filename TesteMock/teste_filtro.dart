import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:catalogo_bebidas/models/bebida.dart';
import 'package:catalogo_bebidas/services/bebida_service.dart';

void main() {
  group('Teste com Mock - Filtrar Bebidas por Tipo', () {
    late BebidaService bebidaService;
    late DioAdapter dioAdapter;

    setUp(() {
      // Inicializa o serviço e o mock
      final dio = Dio();
      dioAdapter = DioAdapter(dio: dio);
      bebidaService = BebidaService(dio: dio);
    });

    test('Deve retornar apenas bebidas do tipo selecionado (ex: whisky)', () async {
      // Dados de teste
      const tipo = 'whisky';
      final bebidasMock = [
        {'id': 1, 'nome': 'The Macallan Quest - whisky escocês', 'tipo': 'whisky'},
        {'id': 2, 'nome': 'Jameson - whisky irlandês', 'tipo': 'whisky'},
      ];

      // Configura o mock para o GET com o filtro de tipo
      dioAdapter.onGet('/bebidas?tipo=$tipo', (server) => server.reply(200, bebidasMock));

      // Chama o método a ser testado
      final resultados = await bebidaService.buscarBebidasPorTipo(tipo);

      // Verifica se apenas bebidas do tipo especificado foram retornadas
      expect(resultados, isNotEmpty);
      expect(resultados.every((bebida) => bebida.tipo == tipo), true);
      expect(resultados.length, equals(bebidasMock.length));
    });
  });
}
