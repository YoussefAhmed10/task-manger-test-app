import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager_test/app/task_manger_app.dart';
import 'package:task_manager_test/core/routing/app_router.dart';

void main() {
  testWidgets('TaskManagerApp renders bootstrap placeholder', (tester) async {
    await tester.pumpWidget(TaskManagerApp(appRouter: AppRouter()));
    await tester.pumpAndSettle();

    expect(find.text('Task Manager'), findsOneWidget);
  });
}
