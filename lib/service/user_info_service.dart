import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:secure_storage/models/user_info_model.dart';

class UserService {
  Future<String> verileriKaydet(UserInformation user) async {
    FlutterSecureStorage prefs = FlutterSecureStorage();
    user.isim = await prefs.read(key: 'isim');
    String ogrenciMiStr = await prefs.read(key: 'ogrenciMi') ?? 'false';
    ogrenciMiStr == 'true' ? user.ogrenciMi = true : user.ogrenciMi = false;
    user.soyIsim = await prefs.read(key: 'soyIsim');
    String _yas = await prefs.read(key: 'yas') ?? '0';
    user.yas = int.parse(_yas);
    print('${user.isim} ${user.soyIsim} ${user.yas} ${user.ogrenciMi}');
    return 'veriler kaydedildi';
  }

  Future<String> verileriGetir(UserInformation user) async {
    FlutterSecureStorage prefs = FlutterSecureStorage();
    await prefs.write(key: 'isim', value: user.isim);
    await prefs.write(key: 'ögrenciMi', value: user.ogrenciMi.toString());
    await prefs.write(key: 'soyIsim', value: user.soyIsim);
    await prefs.write(key: 'yas', value: user.yas.toString());
    print('${user.isim} ${user.soyIsim} ${user.yas} ${user.ogrenciMi}');

    return 'veriler getirildi';
  }
}
