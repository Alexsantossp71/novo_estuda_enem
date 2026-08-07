import 'package:flutter_test/flutter_test.dart';
import 'package:novo_estuda_enem/main.dart' as app;

void main() {
  testWidgets('app inicia sem erros fatais', (WidgetTester tester) async {
    app.main();
    await tester.pump();
    await tester.pump(const Duration(seconds: 10));
    for (var i = 0; i < 30; i++) {
      final ex = tester.takeException();
      if (ex == null) break;
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
