// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:student_union/main.dart';
import 'package:student_union/screens/auth/login/login_screen.dart';

void main() {
  testWidgets('Test When no emil and password is provided', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    //Arrange
    await tester.pumpWidget(MaterialApp(
      home: LoginScreen()
    ));

    final emailField = find.byType(TextFormField).first;
    final passwordField = find.byType(TextFormField).last;
    final loginButton = find.byType(ElevatedButton);

    //Act
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

  });

  testWidgets("Test login screen when email and password is provided", (tester) async{
    //Arrange
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final emailField = find.byType(TextFormField).first;
    final passwordField = find.byType(TextFormField).last;
    final loginButton = find.byType(ElevatedButton);

    //Act
    await tester.enterText(emailField, "jampercola@gmail.com");
    await tester.enterText(passwordField, "asdfghjkl");
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(emailField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);
  });
}
