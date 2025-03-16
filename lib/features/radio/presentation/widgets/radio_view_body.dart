import 'package:flutter/material.dart';
import 'package:zeker_app/features/radio/presentation/widgets/radio_list_view_item.dart';

class RadioViewBody extends StatelessWidget {
  const RadioViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => RadioListViewItem(
        title: "محمود علي البنا",
        id: index + 1,
        url: '',
      ),
    );
  }
}
