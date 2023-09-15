import 'package:flutter/material.dart';
import 'package:mealexplore/models/category.dart';

class CategoryGridItem extends StatefulWidget {
  const CategoryGridItem({super.key, required this.category});
  final Category category;

  @override
  State<CategoryGridItem> createState() => _CategoryGridItemState();
}

class _CategoryGridItemState extends State<CategoryGridItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [
            widget.category.color.withOpacity(0.7),
            widget.category.color
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
            child: Text(
          widget.category.title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        )),
      ),
    );
  }
}
