import 'package:flutter/material.dart';
import 'package:distrostore/Screens/Login/LoginScreens.dart';
import 'package:distrostore/routes.dart';
import 'package:distrostore/theme.dart';

void main() async {
  runApp(
    MaterialApp(
      title: "Distro Store",
      theme: theme(),
      initialRoute: LoginScreen.routeName,
      routes: routes,
    )
  );
}