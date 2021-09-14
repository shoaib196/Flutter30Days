import 'package:flutter/material.dart';
import 'package:store_app/Screens/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileImageWithCamera extends StatelessWidget {
  const ProfileImageWithCamera({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(fit: StackFit.expand, overflow: Overflow.visible, children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/login.png"),
        ),
        Positioned(
            right: -12,
            bottom: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  border: Border.all(color: MyThemes.textColor)),
              child: TextButton(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: context.theme.primaryColor,
                ),
              ),
            )),
      ]),
    );
  }
}
