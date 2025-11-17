import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_screen.dart';

void main() {

  testWidgets("Test Sign ui screen", (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: SignUpScreen()));

  });

}