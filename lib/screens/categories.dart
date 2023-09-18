import 'package:flutter/material.dart';
import 'package:mealexplore/data/dummy_data.dart';
import 'package:mealexplore/widgets/CategoryGridItem.dart';

import '../models/category.dart';
import 'mealsScreen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: 'Some title',
          meals: filteredMeal,
        ),
      ),
    ); // Navigator.push(context, route)
  }
  @override
  Widget build(BuildContext context) {
    return
      GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children:
           [
            for(final category in availableCategories)
              CategoryGridItem(category: category,onSelectCategory: () {
    _selectCategory(context,category);})
          ],
      );
  }
}
