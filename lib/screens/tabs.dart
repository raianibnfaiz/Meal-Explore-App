import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealexplore/screens/categories.dart';
import 'package:mealexplore/screens/mealsScreen.dart';

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

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activeTitle = "Categories";
    if(_selectedPageIndex == 1){
      activePage = const MealsScreen( meals: []);
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
