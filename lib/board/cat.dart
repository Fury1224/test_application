import 'package:flutter/material.dart';
class Cat extends StatelessWidget {
  const Cat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('제목')
        ),
        body: Center(
          child: Text('This is Cat board'),
        )
    );
  }
}
