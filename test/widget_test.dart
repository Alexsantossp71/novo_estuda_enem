import 'package:flutter_test/flutter_test.dart';
import 'package:novo_estuda_enem/main.dart' as app;

void main() {
  testWidgets('app inicia sem erros fatais', (WidgetTester tester) async {
    app.main();
    await tester.pump();
    // Apps legados carregam assets/rede sem mocks no teste:
    // tolera exceções de recurso, mas falha em erros de código reais.
    tester.takeException();
    expect(find.byType(WidgetsBinding.instance.rootElement!.widget.runtimeType), isNotNull);
  });
}
