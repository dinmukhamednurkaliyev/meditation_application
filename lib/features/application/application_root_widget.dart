import 'package:flutter/material.dart';
import 'package:meditation_application/features/application/application.dart';
import 'package:meditation_application/features/onboarding/onboarding.dart';

class ApplicationRootWidget extends StatelessWidget {
  const ApplicationRootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Meditation';
    const debugShowCheckedModeBanner = false;
    const home = OnboardingPage();
    return MaterialApp(
      title: title,
      home: home,
      theme: ApplicationDesign.themes.light,
      darkTheme: ApplicationDesign.themes.dark,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}
