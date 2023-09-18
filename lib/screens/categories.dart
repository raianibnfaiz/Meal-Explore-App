import 'package:flutter/material.dart';
import 'package:mealexplore/data/dummy_data.dart';
import 'package:mealexplore/widgets/CategoryGridItem.dart';

import '../models/category.dart';
import '../models/meals.dart';
import 'mealsScreen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;
  void _selectCategory(BuildContext context, Category category) {
    final filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: 'Some title',
          meals: filteredMeal,
          onToggleFavorite: onToggleFavorite,
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
