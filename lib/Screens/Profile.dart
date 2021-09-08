import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/components/CircularDPWithCamera.dart';
import 'package:velocity_x/velocity_x.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.primaryColor,
        title: "Profile".text.medium.xl4.white.make(),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SizedBox(height: 24), ProfileImageWithCamera()],
        ),
      ),
    );
  }
}
