import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_bebidas/models/harmonizacao.dart'; 
import 'package:catalogo_bebidas/services/harmonizacao_service.dart';

void main() {
  group('Caso de Uso 1: Pesquisar Harmonização para Bebida', () {
    test('Deve retornar harmonizações para uma bebida específica', () async {
      // Supondo que o serviço HarmonizacaoService já está configurado
      final harmonizacaoService = HarmonizacaoService();

      // Nome da bebida a ser pesquisada
      final bebidaNome = 'Vinho Tinto';

      // Realiza a pesquisa
      final resultados = await harmonizacaoService.buscarHarmonizacaoPorBebida(bebidaNome);

      // Verifica se a lista de harmonizações contém uma harmonização esperada
      expect(resultados.isNotEmpty, true, reason: 'Nenhuma harmonização encontrada');
      expect(resultados.any((harmonizacao) => harmonizacao.descricao.contains('queijo')), true,
          reason: 'Harmonização com queijo esperada para vinho tinto');
    });
  });
}
