import 'package:auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_core/test_core.dart';

void main() {
  testWidgets(
    'Open login',
    (tester) async {
      await tester.pumpWidget(
        TestApp(child: LoginScreen(onLoggedIn: () {})),
      );
      await tester.pumpAndSettle();
      expect(find.text('Login'), findsWidgets);
    },
  );
}
