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
    double widget_size = 80.0;

    return Scaffold(
      body: Container(
        //decoration: BoxDecoration(color: Colors.grey),
        child: Column(
          children: [
            Container(  // 위젯 부분
              //decoration: BoxDecoration(border: Border.all(color: Colors.green) ),  // body 부분은 초록 박스
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(  // 강아지 돌봄 버튼
                        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
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
                      Container(  // 고양이 돌봄 버튼
                        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
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
                      Container(  // 후기 버튼
                        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
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
                      Container(  // 이용 안내 버튼
                        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        width:widget_size, height:widget_size,
                        child: ElevatedButton(
                          child: Text('이용 안내'),
                          style:ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 11)),
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
                  Container(  // 돌봄 예약하기 버튼
                    //decoration: BoxDecoration(border: Border.all(color: Colors.blue), color:Colors.white),
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.red), color:Colors.white),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height:70, width:double.maxFinite,
                          child: ElevatedButton(
                            child: Text('돌봄 예약하기'), style: OutlinedButton.styleFrom(backgroundColor: Colors.red,),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Guide()),
                              );
                            },
                          )
                        ),
                      ],
                    ),
                  ),  // 돌봄 예약하기 버튼
                ],
              ),
            ),  // 위젯 부분
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Text("<여러 후기들>")
            ),  // 여러 후기들
            Container(   // 리뷰 부분
              height: 330,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Container(  // A 보호자님
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 80, width:double.maxFinite,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Row(
                              children: [
                                Text("A 보호자님  "),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                              ],
                            )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text("매달 일이 있어 부탁드리는데 항상 잘 케어해주십니다", overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),  // A 보호자님
                    Container(  // B 보호자님
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 80, width:double.maxFinite,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Row(
                              children: [
                                Text("B 보호자님  "),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                                Icon(Icons.star, size:20),
                              ],
                             )
                           ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text("해외 여행 때문에 돌봄 서비스를 이용하게 되었는데 잘 돌봐주셨어요", overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),  // B 보호자님
                    Container(  // C 보호자님
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 80, width:double.maxFinite,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Row(
                                children: [
                                  Text("C 보호자님  "),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text("처음 돌봄 신청했는데 케어 정말 잘 해주시고 요청사항도 잘 들어주셨어요", overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),  // C 보호자님
                    Container(  // D 보호자님
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 80, width:double.maxFinite,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Row(
                                children: [
                                  Text("D 보호자님  "),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text("세 번째 돌봄 신청이네요 개인 사정으로 인해서 급하게 연락드렸는데 항상 잘 케어해주십니다", overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),  // D 보호자님
                    Container(  // E 보호자님
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                      height: 80, width:double.maxFinite,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                              child: Row(
                                children: [
                                  Text("E 보호자님  "),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                  Icon(Icons.star, size:20),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                            child: Text("연락도 잘 해주시고 잘 돌봐주셨어요", overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),  // E 보호자님
                  ],
                ),
              ),
            ), // 리뷰 부분
          ],
        ),
      ),
    );
  }
}
