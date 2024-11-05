import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_bebidas/models/harmonizacao.dart';
import 'package:catalogo_bebidas/services/harmonizacao_service.dart';

void main() {
  group('Caso de Uso 2: Adicionar Harmonização aos Favoritos', () {
    test('Deve adicionar uma harmonização à lista de favoritos', () {
      // Inicializa o serviço
      final harmonizacaoService = HarmonizacaoService();

      // Cria uma harmonização de teste
      final harmonizacao = Harmonizacao(
        id: 1,
        bebidaId: 1,
        descricao: 'Harmonização de Chardonnay com queijo brie',
      );

      // Adiciona aos favoritos
      harmonizacaoService.adicionarAosFavoritos(harmonizacao);

      // Verifica se a harmonização foi adicionada à lista de favoritos
      expect(harmonizacaoService.favoritos.contains(harmonizacao), true);
    });
  });
}
