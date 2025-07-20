import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_english/bloc/theme_bloc/theme_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Center(
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, state) {
            return Column(
              spacing: 30,
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(
                  value: state,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(TogglePressed());
                  },
                ),
                Text(
                  state ? "This is dark mode" : "This is light mode",
                  style: TextStyle(fontSize: 26),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
