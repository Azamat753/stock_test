import 'package:dio/dio.dart';
import 'package:example_test/model/model.dart';

class ApiService {
  Future<List<Model>> getStocks() async {
    final dio = Dio();
    final response = await dio.get('https://dev.codeunion.kz/ailat/api/stocks/list');
    final list = (response.data['data'] as List).map((e) => Model.fromJson(e as Map<String, dynamic>)).toList();
    return list;
  }
}
