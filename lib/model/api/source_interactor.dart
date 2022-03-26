import 'package:gallery/entities/raw_item.dart';

abstract class SourceInteractor {
  Future<List<dynamic>> loadData();

  List<ItemData> parseItems(List<dynamic> rawArray);
}
