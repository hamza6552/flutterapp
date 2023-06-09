import 'package:zabardash/core/di/dependency_injection.dart';
import 'package:zabardash/core/networking/api_manager.dart';
import 'package:zabardash/core/utils/pref_utils.dart';
import 'package:zabardash/core/utils/preference_keys.dart';

class AuthManager {
  AuthManager._privateConstructor();

  static final AuthManager instance = AuthManager._privateConstructor();
  PreferenceUtils _preferenceUtils = locator<PreferenceUtils>();

  Future<void> login(String email, String password) async {
    final params = {
      "username": email,
      "password": password,
    };
    try {
      final response = await ApiManager.instance
          .request("loginForMobile", HttpMethod.POST, params, isFormData: true);
      if (response.data['access_token'] != null) {

       
          // print(respoadb dense1.data["id"]);
          // print(response1.data);

        
        await _preferenceUtils.setStringData(
            PreferenceKeys.ACCESS_TOKEN, response.data['access_token']);
             final response1 = await ApiManager.instance
          .request("users/me/", HttpMethod.GET, params,);
          print("call");
          print(response1.data);
        await _preferenceUtils.setStringData(PreferenceKeys.EMAIL, email);
        await _preferenceUtils.setStringData(PreferenceKeys.PASSWORD, password);
        await _preferenceUtils.setIntData(PreferenceKeys.USER_ID,response1.data["id"]);
        // await _preferenceUtils.setStringData(PreferenceKeys.UserName,response1.data["full_name"]);

        
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> signup(String email, String password, String fullName) async {
    final params = {"email": email, "full_name": fullName, "role": "appUser", "password": password};
    try {
      final response = await ApiManager.instance.request(
        "users/",
        HttpMethod.POST,
        params,
      );
    } catch (e) {
      throw e;
    }
  }
}
