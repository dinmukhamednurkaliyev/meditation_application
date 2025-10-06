import 'package:flutter/material.dart';

import '../onboarding/onboarding.dart';

class MeditationApplication extends StatelessWidget {
  const MeditationApplication({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Meditation';
    return const MaterialApp(title: title, home: OnboardingPage());
  }
}
