import 'package:dio/dio.dart';
import 'package:gallery/entities/raw_item.dart';

import '../source_interactor.dart';

class UnsplashInteractor extends SourceInteractor {
  static final UnsplashInteractor instance = UnsplashInteractor._();

  final apiToken = '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';
  final picsCount = 16.toString();

  UnsplashInteractor._();

  @override
  Future<List<dynamic>> loadData() async {
    return (await Dio().get('https://api.unsplash.com/photos/random?client_id=$apiToken&count=$picsCount')).data
        as List<dynamic>;
  }

  @override
  List<ItemData> parseItems(List<dynamic> rawArray) {
    ItemData parseItem(dynamic raw) {
      final _raw = raw as Map<String, dynamic>;

      final img = _raw['urls']['thumb'];
      final imgFull = _raw['urls']['regular'];
      final author = _raw['user']['username'];

      return ItemData(img: img, imgFull: imgFull, author: author);
    }

    List<ItemData> result = <ItemData>[];
    for (var element in rawArray) {
      result.add(parseItem(element));
    }

    return result;
  }
}
