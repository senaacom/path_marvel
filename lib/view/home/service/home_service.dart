import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../product/utils/md5.dart';
import '../model/marvel_model.dart';

class CharacterListService {
  Future<List<Results>?> getCharacterList({required int page}) async {
    try {
      final dio = Dio();
      String _baseUrl = '${dotenv.env['API_BASE_URL']}characters?';
      String _public = '${dotenv.env['PUBLIC']}';
      String _hash = Hash.generateMd5('${dotenv.env['HASH']}');
      int _offset = 30 * page;

      Response response = await dio.get(
        _baseUrl,
        queryParameters: {
          'limit': 30,
          'offset': _offset,
          'ts': 1,
          'apikey': _public,
          'hash': _hash,
        },
      );

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
