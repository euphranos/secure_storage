import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:secure_storage/models/user_info_model.dart';
import 'package:secure_storage/service/user_info_service.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController adController = TextEditingController();
  TextEditingController soyIsimController = TextEditingController();
  TextEditingController yasController = TextEditingController();
  UserService _userService = UserService();
  UserInformation _user = UserInformation();
  bool myCBox = false;

  @override
  void initState() {
    _userService.verileriKaydet(_user).then((value) {
      print('${_user.isim}');
      adController.text = _user.isim!;
      soyIsimController.text = _user.soyIsim!;
      yasController.text = _user.yas.toString();
      myCBox = _user.ogrenciMi!;

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: adController,
              decoration: InputDecoration(hintText: 'isim'),
            ),
            TextField(
              controller: soyIsimController,
              decoration: InputDecoration(hintText: 'soyisim'),
            ),
            TextField(
              controller: yasController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'yas'),
            ),
            SwitchListTile(
                title: Text('ogrenci misin'),
                value: myCBox,
                onChanged: (value) {
                  myCBox = value;
                  setState(() {});
                }),
            ElevatedButton(
                onPressed: () {
                  _user.isim = adController.text;
                  _user.soyIsim = soyIsimController.text;
                  _user.ogrenciMi = myCBox;
                  _user.yas = int.parse(yasController.text);
                  setState(() {});
                  _userService.verileriGetir(_user);
                },
                child: Text('kaydet')),
          ],
        ),
      ),
    );
  }
}
