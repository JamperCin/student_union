import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/screens/auth/sign_up/sign_up_screen.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.dp()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You don\'t have an account yet to view this content? Create Account.',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Gap(30.dp()),
          ButtonWidget(
            onTap: () {
              navUtils.fireTargetOff(SignUpScreen());
            },
            text: 'Create Account',
            textColor: Theme.of(context).colorScheme.surface,
          ),
        ],
      ),
    );
  }
}
