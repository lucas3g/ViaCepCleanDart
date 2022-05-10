import 'package:flutter/material.dart';
import 'package:via_cep_clean_dart/src/presentation/ui/pages/home/home_page.dart';
import 'package:via_cep_clean_dart/src/theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Via Cep',
      theme: ThemeData(
        primarySwatch: AppTheme.colors.primary,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
      },
    );
  }
}
