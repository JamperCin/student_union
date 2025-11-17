import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:student_union/main.dart' as app;
import 'package:student_union/screens/auth/login/login_screen.dart';
import 'package:student_union/screens/dashboard/main_dashboard_screen.dart';

void main(){

  testWidgets("Test Whole App", (WidgetTester tester) async{
    //Arrange
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    app.main();
    await tester.pumpAndSettle();

    final loginScreen = find.byType(LoginScreen);
    expect(loginScreen, findsOneWidget);

    await Future.delayed(const Duration(seconds: 2));
    //Act
    final emailField = find.byType(TextFormField).first;
    final passwordField = find.byType(TextFormField).last;
    final loginButton = find.byType(ElevatedButton);

    //Assert
    await tester.enterText(emailField, "jampercola@gmail.com");
    await tester.enterText(passwordField, "asdfghjkl");
    await Future.delayed(const Duration(seconds: 2));
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    final dashboardScreen = find.byType(MainDashboardScreen);
    expect(dashboardScreen, findsOneWidget);
    await Future.delayed(const Duration(seconds: 2));
  });
}