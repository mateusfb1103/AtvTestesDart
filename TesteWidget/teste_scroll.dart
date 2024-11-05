import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_bebidas/widgets/lista_bebidas.dart';
import 'package:catalogo_bebidas/models/bebida.dart';

void main() {
  testWidgets('Deve exibir bebidas filtradas em uma lista com scroll', (WidgetTester tester) async {
    // Lista de bebidas de teste
    final bebidas = [
      Bebida(id: 1, nome: 'The Macallan Quest - Whisky Escocês', tipo: 'whisky'),
      Bebida(id: 2, nome: 'Jameson - Whisky Irlandês', tipo: 'whisky'),
      Bebida(id: 3, nome: 'Buffalo Trace - Whisky Americano', tipo: 'whisky'),
    ];

    // Cria o widget de teste
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ListaBebidas(bebidas: bebidas), // ListaBebidas aceita uma lista de bebidas
      ),
    ));

    // Verifica se os itens são exibidos
    for (var bebida in bebidas) {
      expect(find.text(bebida.nome), findsOneWidget);
    }

    // Verifica o scroll na lista
    await tester.drag(find.byType(ListView), const Offset(0, -300));
    await tester.pump();

    // Verifica se ainda é possível visualizar os itens após o scroll
    expect(find.text(bebidas.last.nome), findsOneWidget);
  });
}
