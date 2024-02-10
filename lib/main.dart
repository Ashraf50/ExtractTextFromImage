import 'package:extract_text_and_translate/core/utils/theme.dart';
import 'package:extract_text_and_translate/feature/home/presentation/view_model/cubit/image_cubit.dart';
import 'package:extract_text_and_translate/feature/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool storedValue = pref.getBool('boolValue') ?? false;
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkTheme: storedValue),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageCubit(),
        )
      ],
      child: GetMaterialApp(
        theme: themeProvider.getThemeData,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
