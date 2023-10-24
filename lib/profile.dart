import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  // !!!!!!!!!!! profile.dart 파일에서는 body 만 사용한다 !!!!!!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('This is profile'),
        )
    );
  }
}
