import 'package:flutter/material.dart';
import 'package:zeker_app/features/home/presentation/widgets/custom_floating_button.dart';
import 'package:zeker_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      floatingActionButton: CustomFloationButton(),
    );
  }
}
