import 'package:chargemod_assign/app/home/model/location_response.dart';
import 'package:chargemod_assign/utils/api.dart';
import 'package:chargemod_assign/utils/network_client.dart';
import 'package:get_storage/get_storage.dart';

class LocationRepository {
  final NetworkClient _client = NetworkClient();
  Future<LocationResponse> getLocationDetail() async {
    try {
      var token = GetStorage().read('aToken');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final res = await _client.request(
        RequestType.GET,
        ApiEndPoints.location,
        headers: headers,
      );

      return LocationResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
