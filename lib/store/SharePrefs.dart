import 'package:get/get.dart';
import 'package:untitled/model/User.dart';

class SharePrefs extends GetxController {
  String accessToken = '';
  User? _user;
  setAccessToken (String token) => {
    accessToken = token
  };

  setUser (User user) => {
    this._user = user
  };

}