import 'package:chargemod_assign/app/auth/model/login_response.dart';
import 'package:chargemod_assign/app/auth/model/otp_verify_response.dart';
import 'package:chargemod_assign/utils/api.dart';
import 'package:chargemod_assign/utils/network_client.dart';

class AuthRepository {
  final _client = NetworkClient();

  Future<LoginResponse> sendOtp(String phone) async {
    final body = {"mobile": phone};
    try {
      final res = await _client.request(
        RequestType.POST,
        ApiEndPoints.signIn,
        body: body,
      );
      return LoginResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginResponse> resendOtp(String phone) async {
    final body = {
      "mobile": phone,
      "type": "text",
    };
    try {
      final res = await _client.request(
        RequestType.POST,
        ApiEndPoints.resendOtp,
        body: body,
      );
      return LoginResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<VerifyOtpResponse> verifyOtp(String phone, String otp) async {
    final body = {
      "mobile": phone,
      "otp": otp,
    };
    try {
      final res = await _client.request(
        RequestType.POST,
        ApiEndPoints.verify,
        body: body,
      );
      return VerifyOtpResponse.fromJson(res.data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
