import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zeker_app/config/routes/app_routes.dart';
import 'package:zeker_app/core/utils/app_colors.dart';

class CustomFloationButton extends StatelessWidget {
  const CustomFloationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(10, 50),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: () {
        GoRouter.of(context).push(AppRoutes.searchView);
      },
      child: Icon(
        Icons.search_outlined,
        color: AppColors.colorWhite,
      ),
    );
  }
}
