import 'dart:async';
import 'package:iskaan_inspections_mobile/res/constants/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PreferenceUtil {
  static PreferenceUtil? _instance;
  static Future<PreferenceUtil?> get instance async {
    return await getInstance();
  }

  static SharedPreferences? _spf;
  PreferenceUtil._();
  Future _init() async {
    _spf = await SharedPreferences.getInstance();
  }

  static Future<PreferenceUtil?> getInstance() async {
    if (_instance == null) {
      _instance = PreferenceUtil._();
      await _instance!._init();
    }
    return _instance;
  }

  static bool _beforeCheck() {
    if (_spf == null) {
      return true;
    }
    return false;
  }

  bool hasKey(String key) {
    Set<String>? keys = getKeys();
    return keys!.contains(key);
  }

  Set<String>? getKeys() {
    if (_beforeCheck()) return null;
    return _spf!.getKeys();
  }

  get(String key) {
    if (_beforeCheck()) return null;
    return _spf!.get(key);
  }

  getString(String key) {
    if (_beforeCheck()) return "";
    return _spf!.getString(key);
  }

  Future<bool>? putString(String key, String value) {
    if (_beforeCheck()) return null;
    return _spf!.setString(key, value);
  }

  bool? getBool(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getBool(key);
  }

  Future<bool>? putBool(String key, bool value) {
    if (_beforeCheck()) return null;
    return _spf!.setBool(key, value);
  }

  int? getInt(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getInt(key);
  }

  Future<bool>? putInt(String key, int value) {
    if (_beforeCheck()) return null;
    return _spf!.setInt(key, value);
  }

  double? getDouble(String key) {
    if (_beforeCheck()) return null;
    return _spf!.getDouble(key);
  }

  Future<bool>? putDouble(String key, double value) {
    if (_beforeCheck()) return null;
    return _spf!.setDouble(key, value);
  }

  List<String>? getStringList(String key) {
    return _spf!.getStringList(key);
  }

  Future<bool>? putStringList(String key, List<String> value) {
    if (_beforeCheck()) return null;
    return _spf!.setStringList(key, value);
  }

  dynamic getDynamic(String key) {
    if (_beforeCheck()) return null;
    return _spf!.get(key);
  }

  Future<bool>? remove(String key) {
    if (_beforeCheck()) return null;
    return _spf!.remove(key);
  }

  Future<bool>? clear() {
    if (_beforeCheck()) return null;
    return _spf!.clear();
  }

  // UserModel? get user {
  //   var userJson = getString(Strings.keyUser);
  //   if (userJson != null) {
  //     return UserModel.fromJson(jsonDecode(userJson));
  //   }
  //   return null;
  // }
  //
  // set user(UserModel? user) {
  //   putString(Strings.keyUser, jsonEncode(user?.toJson()));
  // }

  String? get token {
    return getString(Strings.keyToken);
  }

  set token(String? token) {
    if (token != null) {
      putString(Strings.keyToken, token);
    }
  }

}

late PreferenceUtil spUtil;
initPreferences() async {
  spUtil = (await PreferenceUtil.getInstance())!;
}
