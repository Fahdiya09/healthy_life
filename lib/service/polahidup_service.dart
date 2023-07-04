import 'package:dio/dio.dart';
import 'package:healthy_life/helpers/api_client.dart';
import 'package:healthy_life/model/polahidup.dart';

class PolahidupService {
  Future<List<Polahidup>> listData() async {
    final Response response = await ApiClient().get('polahidup');
    print(response);
    final List data = response.data as List;
    List<Polahidup> result =
        data.map((json) => Polahidup.fromJson(json)).toList();
    return result;
  }

  Future<Polahidup> simpan(Polahidup polahidup) async {
    var data = polahidup.toJson();
    final Response response = await ApiClient().post('polahidup', data);
    Polahidup result = Polahidup.fromJson(response.data);
    return result;
  }

  Future<Polahidup> ubah(Polahidup polahidup, String id) async {
    var data = polahidup.toJson();
    final Response response = await ApiClient().put('polahidup/${id}', data);
    print(response);
    Polahidup result = Polahidup.fromJson(response.data);
    return result;
  }

  Future<Polahidup> getById(String id) async {
    final Response response = await ApiClient().get('polahidup/${id}');
    Polahidup result = Polahidup.fromJson(response.data);
    return result;
  }

  Future<Polahidup> hapus(Polahidup polahidup) async {
    final Response response =
        await ApiClient().delete('polahidup/${polahidup.id}');
    Polahidup result = Polahidup.fromJson(response.data);
    return result;
  }
}
