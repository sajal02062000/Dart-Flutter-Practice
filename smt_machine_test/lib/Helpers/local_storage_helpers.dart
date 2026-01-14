import 'package:get_storage/get_storage.dart';

class LocalStorageHelper {
  static final GetStorage getStorage = GetStorage();

  static Future<void> init() async {
    await GetStorage.init();
  }

  static void storeToken({required bool isLoggedin, required String email}) {
    getStorage.write('is_loggedin', isLoggedin);
    getStorage.write('email', email);
  }

  static bool getLoggedin() {
    return getStorage.read('is_loggedin') ?? false;
  }

  static String getEmail() {
    return getStorage.read('email') ?? '';
  }

  static void clearData() {
    getStorage.erase();
  }
}
