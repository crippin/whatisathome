import 'package:flutter/material.dart';

import 'category_card.dart';
import 'category_model.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  CategoryList(this.categories);

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, int) {
        return CategoryCard(categories[int]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }
}