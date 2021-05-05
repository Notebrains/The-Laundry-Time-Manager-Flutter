import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlt_manager/models/shared_pref_address_model.dart';
import 'package:tlt_manager/models/shared_pref_user_model.dart';

class SharedPreferenceHelper {
  void saveUserData(
    String userId,
    String userName,
    String userEmail,
    String userMobile,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', userId);
    prefs.setString('name', userName);
    prefs.setString('email', userEmail);
    prefs.setString('mobile', userMobile);
  }

  Future<SharedPrefUserModel> getUserSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    print('------saved ${prefs.getString('name')}');

    return SharedPrefUserModel(
      prefs.getString('id'),
      prefs.getString('name'),
      prefs.getString('email'),
      prefs.getString('mobile'),
    );
  }

  void saveUserMemberId(String memberId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', memberId);
    //print('----saved $xApiKey');
  }

  Future<String> getUserCustomerId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id') ?? '';
  }

  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fullName') ?? 0;
  }

  Future<String> getUserImage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('photo') ?? 0;
  }

  void saveIsEmailValid(String isValidEmail) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('isValidEmail', isValidEmail);
    //print('----saved $xApiKey');
  }

  void clearPrefData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
