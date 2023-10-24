import 'package:flutter/material.dart';
class Map extends StatelessWidget {
  const Map({super.key});

  // !!!!!!!!!!! map.dart 파일에서는 body 만 사용한다 !!!!!!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is Map'),
      )
    );
  }
}
