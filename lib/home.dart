import 'package:flutter/material.dart';
import '/board/dog.dart';
import '/board/cat.dart';
import '/board/review.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void printhi() {
    print("하이");
  }

  // !!!!!!!!!!! home.dart 파일에서는 body 만 사용한다 !!!!!!!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.green) ),  // body 부분은 초록 박스
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(70, 70, 70, 200),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:140, height:150,
                    child: ElevatedButton(
                      child: Text('강아지'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Dog()),
                        );
                      },
                    )
                ),  // 강아지 돌봄 페이지 이동
                Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:140, height:150,
                    child: ElevatedButton(
                      child: Text('고양이'),
                      onPressed: (){

                      },
                    )
                ),  // 고양이 돌봄 페이지 이동
                Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:140, height:150,
                    child: ElevatedButton(
                      child: Text('후기'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Review()),
                        );
                      },
                    )
                ),  // 후기 페이지 이동
              ],
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              height:250,
            ),
          ],
        ),
      ),
    );
  }
}
