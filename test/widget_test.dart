import 'package:flutter_test/flutter_test.dart';

import 'package:my_secret_wine/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MySecretWineApp());

    // Verify that our app starts correctly.
    expect(find.text('My Secret Wine'), findsOneWidget);
    expect(find.text('¡Bienvenido a My Secret Wine!'), findsOneWidget);
  });
}