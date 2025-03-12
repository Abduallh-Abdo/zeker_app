import 'package:flutter/material.dart';
import 'package:zeker_app/core/models/category_model.dart';
import 'package:zeker_app/features/home/presentation/widgets/category_list_view_body.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) => CategoryListViewBody(
          categoryModel: categoryList[index],
        ),
      ),
    );
  }
}
