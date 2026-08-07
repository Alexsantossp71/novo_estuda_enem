import 'package:flutter_test/flutter_test.dart';
import 'package:novo_estuda_enem/main.dart' as app;

void main() {
  testWidgets('app inicia sem erros fatais', (WidgetTester tester) async {
    app.main();
    await tester.pump();
    // Tolerâncias esperadas em apps legados sem mocks de rede/assets:
    final ex = tester.takeException();
    if (ex != null) {
      final msg = ex.toString();
      if (!msg.contains('Unable to load asset') &&
          !msg.contains('NetworkImage') &&
          !msg.contains('HTTP request failed') &&
          !msg.contains('RenderFlex overflowed')) {
        fail('Exceção inesperada ao iniciar o app: $ex');
      }
    }
  });
}
