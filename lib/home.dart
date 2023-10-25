import 'package:flutter/material.dart';
import '/board/dog.dart';
import '/board/cat.dart';
import '/board/review.dart';
import '/board/guide.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void printhi() {
    print("하이");
  }

  // !!!!!!!!!!! home.dart 파일에서는 body 만 사용한다 !!!!!!!



  @override
  Widget build(BuildContext context) {
    double widget_size = 90.0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.green) ),  // body 부분은 초록 박스
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:widget_size, height:widget_size,
                    child: ElevatedButton(
                      child: Text('강아지'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Dog()),
                        );
                      },
                    )
                  ),  // 강아지 돌봄 버튼
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:widget_size, height:widget_size,
                    child: ElevatedButton(
                      child: Text('고양이'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cat()),
                        );
                      },
                    )
                  ),  // 고양이 돌봄 버튼
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:widget_size, height:widget_size,
                    child: ElevatedButton(
                      child: Text('후기'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Review()),
                        );
                      },
                    )
                  ),  // 후기 버튼
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    width:widget_size, height:widget_size,
                    child: ElevatedButton(
                      child: Text('이용 안내'),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Guide()),
                        );
                      },
                    )
                  ),  // 이용 안내 버튼
                ],
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.blue), color:Colors.white),
                height: 500,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.red), color:Colors.white),
                        height:80, width:double.maxFinite,
                        child: ElevatedButton(
                          child: Text('돌봄 예약하기'), style: OutlinedButton.styleFrom(backgroundColor: Colors.red,),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Guide()),
                            );
                          },
                        )
                    ),  // 돌봄 예약하기 버튼
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
