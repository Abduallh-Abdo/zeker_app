import 'package:flutter/material.dart';
import 'package:zeker_app/core/models/category_model.dart';
import 'package:zeker_app/core/utils/app_colors.dart';
import 'package:zeker_app/core/utils/style_manger.dart';

class CategoryListViewBody extends StatelessWidget {
  const CategoryListViewBody({
    super.key,
    required this.categoryModel,
  });
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 73,
      height: 37,
      margin: EdgeInsets.only(
        top: 11,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.primaryColor,
      ),
      child: Text(
        categoryModel.title,
        style: StyleManger.textStyleBold16.copyWith(
          color: AppColors.colorWhite,
        ),
      ),
    );
  }
}
