import 'package:gallery/entities/raw_item.dart';
import 'package:gallery/model/api/unsplash/unsplash_interactor.dart';

class ApiController {
  static final ApiController instance = ApiController._();

  final unsplashInteractor = UnsplashInteractor.instance;

  ApiController._();

  Future<List<ItemData>> loadContent() async {
    return unsplashInteractor.parseItems(await unsplashInteractor.loadData());
  }
}
