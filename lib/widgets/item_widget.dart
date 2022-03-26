import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gallery/entities/raw_item.dart';

class Item extends StatelessWidget {
  final ItemData data;

  const Item({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          InkWell(
            onTap: () => showDialog(
                builder: (BuildContext context) => Container(
                    color: Colors.black,
                    child: Image.network(
                      data.imgFull,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    )),
                context: context),
            child: Image.network(data.img),
          ),
          Text(data.author,
              style: const TextStyle(
                  color: Colors.white, shadows: [Shadow(color: Colors.black, offset: Offset(1.4, 1.4))]))
        ],
      ),
    );
  }
}
