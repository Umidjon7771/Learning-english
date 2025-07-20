import 'package:flutter/material.dart';
import 'package:learning_english/bloc/theme_bloc/theme_bloc.dart';
import 'package:learning_english/core/text/app_strings.dart';
import 'package:learning_english/core/themes/app_theme.dart';
import 'package:learning_english/core/themes/app_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_english/screen/main_screen.dart';
import 'package:learning_english/screen/splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class EnglishLearningApp extends StatelessWidget {
  const EnglishLearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (context, state) {
        return MaterialApp(
          themeMode: state ? ThemeMode.dark : ThemeMode.light,
          darkTheme: AppTheme.dark,
          title: AppStrings.englishLearning,
          theme: AppTheme.light,
          home: MainScreen(),
          debugShowCheckedModeBanner: false,
        );

        // return MaterialApp(
        //   title: 'Flutter Demo',
        //   // The Mandy red, light theme.
        //   theme: lightTheme,
        //   // The Mandy red, dark theme.
        //   darkTheme: darkTheme,
        //   // Use dark or light theme based on system setting.
        //   themeMode: state ? ThemeMode.dark : ThemeMode.light,
        //   home: const MainScreen(),
        // );
      },
    );
  }
}
