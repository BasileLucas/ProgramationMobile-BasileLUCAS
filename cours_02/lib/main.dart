import 'package:flutter/material.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/model/product.dart'; // Import nécessaire
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_theme_extension.dart';
import 'package:formation_flutter/screens/product_page.dart';
import 'package:formation_flutter/widgets/product_inherited.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        extensions: [OffThemeExtension.defaultValues()],
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.nutriscoreA),
        fontFamily: 'Avenir',
        textTheme: const TextTheme(headlineMedium: TextStyle()),
      ),
      debugShowCheckedModeBanner: false,
      // On enveloppe la page avec les données du produit
      home: ProductInherited(
        product: generateProduct(), 
        child: const ProductPage(),
      ),
    );
  }
}