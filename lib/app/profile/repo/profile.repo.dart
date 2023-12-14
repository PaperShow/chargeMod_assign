import 'package:chargemod_assign/app/profile/model/update_response.dart';
import 'package:chargemod_assign/app/profile/model/user_detail_response.dart';
import 'package:chargemod_assign/utils/api.dart';
import 'package:chargemod_assign/utils/network_client.dart';
import 'package:get_storage/get_storage.dart';

class ProfileRepository {
  final NetworkClient _client = NetworkClient();
  Future<UpdateProfileResponse> registerDetails(
      String phone, String first, String last, String email) async {
    final body = {
      "mobile": phone,
      "firstName": first,
      "lastName": last,
      "email": email
    };
    try {
      final res = await _client.request(
        RequestType.POST,
        ApiEndPoints.register,
        body: body,
      );

      return UpdateProfileResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserDetailResponse> getProfileDetail() async {
    try {
      var token = GetStorage().read('aToken');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };
      final res = await _client.request(
        RequestType.GET,
        ApiEndPoints.getUser,
        headers: headers,
      );

      return UserDetailResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
