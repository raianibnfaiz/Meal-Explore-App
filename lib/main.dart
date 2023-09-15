import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealexplore/data/dummy_data.dart';
import 'package:mealexplore/screens/categories.dart';
import 'package:mealexplore/screens/mealsScreen.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      home: const MealsScreen(title: "Some Meals", meals: dummyMeals),
      debugShowCheckedModeBanner: false,
    );
  }
}
