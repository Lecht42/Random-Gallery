import 'package:gallery/entities/raw_item.dart';

import 'api/api_controller.dart';

class Model {

  static late List<ItemData> data = [];
  

  Model() {
    refreshData();
  }

  static Future<bool> refreshData() async {
    data = await ApiController.instance.loadContent();
    return true;
  }
}