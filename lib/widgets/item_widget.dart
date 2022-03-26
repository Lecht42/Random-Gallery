import 'package:flutter/material.dart';
import 'package:gallery/entities/raw_item.dart';

class Item extends StatelessWidget {
  final ItemData data;

  const Item({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [Image.network(data.img), Center(child: Text(data.author))],
    );
  }
}
