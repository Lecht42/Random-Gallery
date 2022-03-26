import 'package:flutter/material.dart';
import 'package:gallery/entities/raw_item.dart';
import 'package:gallery/widgets/gallery_widget.dart';

import '../model/model.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late List<ItemData> _items = Model.data;

  @override
  initState() {
    super.initState();

    refreshItems();
  }

  refreshItems() async {
    await Model.refreshData();

    setState(() => _items = Model.data);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Random Gallery'),
        ),
        body: FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => Gallery(items: _items)),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh',
          onPressed: () => refreshItems(),
          child: const Icon(IconData(0xe514, fontFamily: 'MaterialIcons')),
        ),
      );
}
