import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealexplore/screens/categories.dart';
import 'package:mealexplore/screens/mealsScreen.dart';

import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  final List<Meal> _favoriteMeals = [];
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activeTitle = "Categories";
    if(_selectedPageIndex == 1){
      activePage =  MealsScreen( meals: [], onToggleFavorite: _toggleMealFavoriteStatus,);
      activeTitle = "Your Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text(activeTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
