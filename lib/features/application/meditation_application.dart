import 'package:flutter/material.dart';

import '../onboarding/onboarding.dart';

class MeditationApplication extends StatelessWidget {
  const MeditationApplication({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Meditation';
    const debugShowCheckedModeBanner = false;
    const home = OnboardingPage();
    return const MaterialApp(
      title: title,
      home: home,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}
