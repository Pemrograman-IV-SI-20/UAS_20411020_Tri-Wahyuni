import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:distrostore/Api/configAPI.dart';
import 'package:flutter/material.dart';
//import 'package:distrostore/API/ConfigUrl.dart';
import 'package:distrostore/Component/custom_surfix_icon.dart';
import 'package:distrostore/Component/default_button_custome_color.dart';
//import 'package:distrostore/Screens/Admin/HomeAdminScreens.dart';
import 'package:distrostore/Screens/Login/LoginScreens.dart';
import 'package:distrostore/Screens/Register/RegistrasiScreens.dart';
//import 'package:distrostore/Screens/User/HomeUserScreens.dart';
//import 'package:distrostore/Screens/Users/HomeUserScreens.dart';
import 'package:distrostore/size_config.dart';
import 'package:distrostore/utils/constans.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remeber = false;

  Response? response;
  var dio = Dio();

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                  value: remeber,
                  onChanged: (value) {
                    setState(() {
                      remeber = value;
                    });
                  }),
              Text("Tetap Masuk"),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: () {
              prosesLogin(txtUserName.text, txtPassword.text);
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUserName,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Username',
          hintText: 'Masukan username anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Masukan password anda',
          labelStyle: TextStyle(
              color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
          )),
    );
  }

  void prosesLogin(username, password) async {
    utilsApps.showDialog(context);
    bool status;
    var msg;
    var dataUserLogin;
    try {
      response = await dio
          .post(urlLogin, data: {'username': username, 'password': password});
      status = response!.data['sukses'];
      msg = response!.data['msg'];
      dataUserLogin = response!.data['data'];
      setState(() {
        if (status) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.RIGHSLIDE,
            title: 'Peringatan',
            desc: 'Berhasil Login',
            btnOkOnPress: () {
              utilsApps.hideDialog(context);
              print(dataUserLogin);
              dataUserLogin = response!.data['data'];
              if (dataUserLogin['role'] == 1) {
                print("Lempar kehalaman User Biasa");
                //Navigator.pushNamed(context, HomeUserScreen.routeName);
              } else if (dataUserLogin['role'] == 2) {
                //Navigator.pushNamed(context, HomeAdminScreens.routeName);
              } else {
                print("Halaman tidak tersedia");
              }
               Navigator.pushNamed(context, LoginScreen.routeName);
            },
          )..show();
        } else {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.RIGHSLIDE,
              title: 'Peringatan',
              desc: 'Gagal Login $msg',
              btnOkOnPress: () {},
              btnOkColor: kColorBlue)
            ..show();
        }
      });
    } catch (e) {
      setState(() {
        utilsApps.hideDialog(context);
      });
      AwesomeDialog(
        context: context,
        dialogType: DialogType.ERROR,
        animType: AnimType.RIGHSLIDE,
        title: 'PERINGATAN !!!',
        desc: 'Terjadi Kesalahan Pada Server',
        btnOkOnPress: () {},
      )..show();
    }

    print(response!.data['msg']);
  }
}