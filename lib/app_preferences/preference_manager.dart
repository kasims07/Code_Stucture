import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/src/transformers/flat_map.dart';

class PreferencesManager{

  Future<SharedPreferences> _getPreferences() async =>
      await SharedPreferences.getInstance();

  /// Get [String] from the [SharedPreferences]
  Stream<String?> getString(String key) {
    return _getSharedPreference()
        .map((preference) => preference.getString(key));
  }

  /// Set [String] to the [SharedPreferences]
  Stream<bool> setString(String key, String value) {
    return _getSharedPreference().flatMap(
            (preference) => _convertToRx(preference.setString(key, value)));
  }

  Stream<SharedPreferences> _getSharedPreference() {
    return _convertToRx(_getPreferences());
  }

  Stream<T> _convertToRx<T>(Future<T> future) {
    return future.asStream();
  }
}