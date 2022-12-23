import 'package:agent/agent.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_core/test_core.dart';

void main() {
  testWidgets(
    'Open agent list',
    (tester) async {
      await tester.pumpWidget(
        const TestApp(child: AgentListScreen()),
      );
      await tester.pumpAndSettle();
      expect(find.text('Agents'), findsWidgets);
    },
  );
}
