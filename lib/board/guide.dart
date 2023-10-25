import 'package:flutter/material.dart';
class Guide extends StatelessWidget {
  const Guide({super.key});

  // !!!!!!!!!!! guide.dart 파일에서는 body 만 사용한다 !!!!!!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('제목')
        ),
        body: Center(
          child: Text('This is guide'),
        )
    );
  }
}
