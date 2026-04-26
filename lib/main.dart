import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:kartify/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    BlocProvider(
      create: (_) =>
          ThemeBloc(themePreferences: ThemePreferencesImpl(prefs: prefs)),
      child: const KartifyApp(),
    ),
  );
}

class KartifyApp extends StatelessWidget {
  const KartifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Kartify',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: state.themeMode,
          routerConfig: appRouter,
        );
      },
    );
  }
}
