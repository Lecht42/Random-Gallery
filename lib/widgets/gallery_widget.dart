import 'package:flutter/material.dart';
import 'package:gallery/entities/raw_item.dart';
import 'item_widget.dart';

class Gallery extends StatelessWidget {
  late List<ItemData> items;

  Gallery({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20.0),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => Item(data: items[index]),
    );
  }
}
