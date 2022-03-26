import 'package:flutter/material.dart';
import 'package:gallery/entities/raw_item.dart';
import 'package:gallery/model/model.dart';
import 'package:gallery/widgets/gallery_widget.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late List<ItemData> _items = Model.data;
  late bool _isLoading;

  @override
  initState() {
    super.initState();

    refreshItems();
  }

  void refreshItems() async {
    setState(() => _isLoading = true);

    await Model.refreshData();

    setState(() {
      _items = Model.data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Random Gallery'),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(padding: const EdgeInsets.only(top: 20.0, bottom: 20.0), child: Gallery(items: _items)),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Refresh',
          onPressed: () => refreshItems(),
          child: const Icon(IconData(0xe514, fontFamily: 'MaterialIcons')),
        ),
      );
}
