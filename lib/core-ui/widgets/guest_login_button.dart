import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:student_union/core/def/global_access.dart';

class GuestLoginButton extends StatelessWidget {
  const GuestLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: TextButton.icon(
        onPressed: () {
          isGuestUser.value = true;
          final uuid = Uuid().v4();
          appPreference.setToken(uuid);
          navUtils.fireTargetHome();
        },
        label: Text(
          'Login as a Guest User',
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.secondary),
        ),
        icon: Icon(Icons.person, color: colorScheme.secondary, size: 20.dp()),
      ),
    );
  }
}
