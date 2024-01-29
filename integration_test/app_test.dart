import 'package:authors_app/repository/home_screen_repository.dart';
import 'package:authors_app/screens/home_screen.dart';
import 'package:authors_app/utils/theams.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
// import 'package:authors_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Search auto complete test - ', () {
    testWidgets('Checking the autocomplete', (tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
        create: (context) => HomeScreenRepository(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const HomeScreen(),
        ),
      ));
      await Future.delayed(const Duration(seconds: 4));
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 4));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'lew');
      await tester.pumpAndSettle();
      expect(find.text("Lewis Carroll"), findsNWidgets(4));
      await Future.delayed(const Duration(seconds: 4));
    });
  });
}
