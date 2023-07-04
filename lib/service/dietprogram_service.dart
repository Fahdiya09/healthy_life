import 'package:dio/dio.dart';
import 'package:healthy_life/helpers/api_client.dart';
import 'package:healthy_life/model/dietprogram.dart';

class DietprogramService {
  Future<List<Dietprogram>> listData() async {
    final Response response = await ApiClient().get('dietprogram');
    final List data = response.data as List;
    List<Dietprogram> result =
        data.map((json) => Dietprogram.fromJson(json)).toList();
    return result;
  }

  Future<Dietprogram> simpan(Dietprogram dietprogram) async {
    var data = dietprogram.toJson();
    final Response response = await ApiClient().post('dietprogram', data);
    Dietprogram result = Dietprogram.fromJson(response.data);
    return result;
  }

  Future<Dietprogram> ubah(Dietprogram dietprogram, String id) async {
    var data = dietprogram.toJson();
    final Response response = await ApiClient().put('dietprogram/${id}', data);
    print(response);
    Dietprogram result = Dietprogram.fromJson(response.data);
    return result;
  }

  Future<Dietprogram> getById(String id) async {
    final Response response = await ApiClient().get('dietprogram/${id}');
    Dietprogram result = Dietprogram.fromJson(response.data);
    return result;
  }

  Future<Dietprogram> hapus(Dietprogram dietprogram) async {
    final Response response =
        await ApiClient().delete('dietprogram/${dietprogram.id}');
    Dietprogram result = Dietprogram.fromJson(response.data);
    return result;
  }
}
