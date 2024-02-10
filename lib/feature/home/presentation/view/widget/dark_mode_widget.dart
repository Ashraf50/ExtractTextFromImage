import 'package:extract_text_and_translate/core/constant/text_style.dart';
import 'package:extract_text_and_translate/core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DarkModeWidget extends StatefulWidget {
  const DarkModeWidget({super.key});

  @override
  State<DarkModeWidget> createState() => _DarkModeWidgetState();
}

class _DarkModeWidgetState extends State<DarkModeWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Dark Mode",
            style: Styles.textStyle16,
          ),
          Switch(
            value: themeProvider.isDarkTheme,
            onChanged: (val) {
              themeProvider.setThemeData = val;
            },
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
