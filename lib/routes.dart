import 'package:flutter/material.dart';
//import 'package:toko_gitar_flutter/Screens/Admin/Crud/EditGitarScreen.dart';
//import 'package:toko_gitar_flutter/Screens/Admin/Crud/InputGitarScreen.dart';
//import 'package:toko_gitar_flutter/Screens/Admin/HomeAdminScreens.dart';
import 'package:distrostore/Screens/Register/RegistrasiScreens.dart';
import 'package:distrostore/Screens/Login/LoginScreens.dart';
//import 'package:toko_gitar_flutter/Screens/User/HomeUserScreens.dart';

final Map<String, WidgetBuilder> routes = {
  // Login registrasi
  LoginScreen.routeName:(context) => LoginScreen(),
  RegisterScreen.routeName:(context) => RegisterScreen(),

  //routes user biasa
  //HomeUserScreen.routeName:(context) => HomeUserScreen(),

  //routes admin
  // HomeAdminScreens.routeName:(context) => HomeAdminScreens(),
  // InputGitarScreens.routeName:(context) => InputGitarScreens(),
  // EditGitarScreens.routeName:(context) => EditGitarScreens(),
};