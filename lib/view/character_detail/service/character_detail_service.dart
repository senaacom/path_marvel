import 'dart:io';

import 'package:dio/dio.dart';

import '../../../product/utils/md5.dart';
import '../../home/model/marvel_model.dart';

class CharacterDetailService {
  Future<List<Results>?> getCharacterDetail(int id) async {
    try {
      // https: //gateway.marvel.com/v1/public/characters?ts=1&apikey=f070b57739b2e611946154ed5a13671e&hash=2eb2d5c4c3d86fc3ee8ee56689e3eb7e
      final dio = Dio();
      // https: //gateway.marvel.com:443/v1/public/characters/1011334/comics?dateRange=2005-01-01%2C2022-06-01&orderBy=-issueNumber&limit=10&apikey=c35df3c6ceb9b60a1d4c0d8767460868
      const _baseUrl = "https://gateway.marvel.com/v1/public/";

      // final _base =
      //     "https://gateway.marvel.com/v1/public/characters/$id/comics?ts=1&dateRange=2005-01-01%2C2023-06-01&orderBy=-onsaleDate&limit=10&apikey=f070b57739b2e611946154ed5a13671e&hash=2eb2d5c4c3d86fc3ee8ee56689e3eb7e";
      final Response response = await dio.get(
          _baseUrl +
              "characters/$id/comics?ts=1&dateRange=2005-01-01%2C2023-12-01",
          queryParameters: {
            'orderBy': '-onsaleDate',
            'limit': 10,
            'apikey': "c35df3c6ceb9b60a1d4c0d8767460868",
            'hash': Hash.generateMd5(
                "1c31605ef29cfd2bff4f5e9a79fe8a610e608cd8bc35df3c6ceb9b60a1d4c0d8767460868")
          });

      if (response.statusCode == 200) {
        List<Results> char = (response.data['data']['results'] as List)
            .map((e) => Results.fromJson(e))
            .toList();
        print(char);

        return char;
      }
    } on DioError catch (e) {
      if (e is SocketException) {
        throw 'İnternet';
      } else {
        throw 'Bir Şeyler Ters Gitti';
      }
    }
    return null;
  }
}
