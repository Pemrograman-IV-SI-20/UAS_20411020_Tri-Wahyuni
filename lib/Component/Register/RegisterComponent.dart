import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:distrostore/Component/Register/RegisterForm.dart';
import 'package:distrostore/size_config.dart';
import 'package:distrostore/utils/constans.dart';

class RegisterComponent extends StatefulWidget {
  @override
  _RegisterComponent createState() => _RegisterComponent();
}

class _RegisterComponent extends State<RegisterComponent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                  "REGISTRASI",
                  style: TextStyle(fontSize: 30, color: kPrimaryColor),
                  ), 
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  SimpleShadow(
                    child: Image.asset(
                      "assets/images/logo.png", 
                    height: 100, 
                    width: 100,
                    ),
                    opacity: 0.5,
                    color: kColorRedSlow,
                    offset: Offset(5, 5),
                    sigma: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Registrasi !", 
                          style: mTitleStyle,
                        )
                      ],
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    SignUpform()
                ],
              ),
            ),
          ),
      ),
    );
  }

}