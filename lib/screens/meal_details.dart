import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal,  required this.onToggleFavorite,});
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),actions: [
        IconButton(
          onPressed: () {
            onToggleFavorite(meal);
          },
          icon: const Icon(Icons.star),
        )
      ]),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text("Ingredients", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color:Colors.deepOrange
              ),),
              for(final ingredients in meal.ingredients)
                Text(ingredients, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),),
              SizedBox(height: 16),
              Text("Steps", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.deepOrange
              ),),
              for(final ingredients in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Text(ingredients, style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),),
                ),

            ],
          ),
        )

    );
  }
}
