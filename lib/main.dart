import 'package:dashborad/features/auth/login/presentations/login_screen.dart';
import 'package:dashborad/ui/theme.dart';
import 'package:dashborad/ui/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ThemeModeProvider _themeModeProvider = ThemeModeProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _themeModeProvider,
      builder: (context, _) {
        final themeModeProvider = Provider.of<ThemeModeProvider>(context);
        return MaterialApp(
          title: 'DashBord',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
          darkTheme: ThemeData(colorScheme: MaterialTheme.lightScheme()),
          themeMode: themeModeProvider.themeMode,
          home: const LoginScreen(),
        );
      },
    );
  }
}
