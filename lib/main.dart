import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/common/constants/colors.dart';
import 'package:primecare_lab_soft/features/dashboard/presentation/dashboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Responsive Dashboard',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primaryColor: MaterialColor(primaryColorCode, <int, Color>{
          50: const Color(primaryColorCode).withOpacity(0.1),
          100: const Color(primaryColorCode).withOpacity(0.2),
          200: const Color(primaryColorCode).withOpacity(0.3),
          300: const Color(primaryColorCode).withOpacity(0.4),
          400: const Color(primaryColorCode).withOpacity(0.5),
          500: const Color(primaryColorCode).withOpacity(0.6),
          600: const Color(primaryColorCode).withOpacity(0.7),
          700: const Color(primaryColorCode).withOpacity(0.8),
          800: const Color(primaryColorCode).withOpacity(0.9),
          900: const Color(primaryColorCode).withOpacity(1.0),
        }),
        scaffoldBackgroundColor: const Color(0xffF5F7FA),
        fontFamily: 'IBMPlexSans',
        brightness: Brightness.light,
      ),
      home: DashBoard(),
    );
  }
}
