import 'package:flutter/material.dart';
class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('제목')
        ),
        body: Center(
          child: Text('This is Review board'),
        )
    );
  }
}
