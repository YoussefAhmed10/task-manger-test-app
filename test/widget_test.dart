import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_test/app/task_manger_app.dart';

void main() {
  testWidgets('TaskManagerApp renders bootstrap placeholder', (tester) async {
    await tester.pumpWidget(const TaskManagerApp());
    await tester.pumpAndSettle();

    expect(find.text('Task Manager'), findsOneWidget);
  });
}
