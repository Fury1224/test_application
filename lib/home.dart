import 'package:flutter/material.dart';
import '/board/dog.dart';
import '/board/cat.dart';
import '/board/review.dart';
import '/board/guide.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // 신청 현황 게시글 작성 함수
  Container createBoard(double deviceWidth, double deviceHeight, String name, int imageNum, String address){
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      height: deviceHeight*0.16, width:double.maxFinite,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            height: deviceHeight*0.1,
            child: Row( // 윗컬럼 Row
              children: [
                Container(  // 프로필 사진, box 사이즈에 맞춰서 표시
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                      image: DecorationImage(image: AssetImage('assets/$imageNum.jpg'), fit: BoxFit.fill)),
                  width: deviceWidth*0.215,
                ),  // 프로필 사진, box 사이즈에 맞춰서 표시
                Container(  // 이름, 주소
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  width:deviceWidth*0.48,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(3),
                        alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        height: deviceHeight*0.05,
                        child: Text(name, style: TextStyle(fontSize:17),),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0,3,0,0),
                        padding: EdgeInsets.all(3),
                        alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        height: deviceHeight*0.04,
                        child: Text(address, style: TextStyle(fontSize:13),),
                      ),
                    ],
                  ),
                ),  // 이름, 주소
                Container(  // 요금
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                  width: deviceWidth*0.265,
                  child: Container(  // 요금
                    //padding: EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    height: deviceHeight*0.05,
                    child: Text('1시간\t: 10,000원\n  1박   : 50,000원', style: TextStyle(fontSize:14),),
                  ),
                ),  // 요금
              ],
            ),
          ),  // 돌보미 정보
          Container(  // 돌보미 정보, 수락, 거절
            margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
            decoration: BoxDecoration(border: Border.all(color: Colors.red)),
            height: deviceHeight*0.05,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0,0,5,0),
                  alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                  decoration: BoxDecoration(border: Border.all(color: Colors.red), color: Colors.white38,),
                  width: deviceWidth*0.63,
                  child: Text('#여성 #21세 #1인가구 \n#반려동물있음', style: TextStyle(fontSize:13,)),),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: ElevatedButton(
                    child: Text('수락'),
                    onPressed: (){

                    },
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    child: Text('거절'),
                    onPressed: (){

                    },
                  ),
                ),
              ],
            ),
          ),  // 돌보미 소개 내용
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {

    // 현재 디바이스 크기
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    double widget_size = deviceWidth * 0.2;

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
                          style:ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 12)),
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
                    height: deviceHeight*0.1,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.red), color:Colors.white),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height:deviceHeight*0.07, width:double.maxFinite,
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
                child: Text("<신청 현황>")
            ),
            Container(   // 신청현황
              margin: EdgeInsets.fromLTRB(5, 0, 0, 5),
              height: deviceHeight*0.49,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    createBoard(deviceWidth, deviceHeight, '신청자 1', 1, '충남 아산시 신창면 순천향로 22'),
                    createBoard(deviceWidth, deviceHeight, '신청자 2', 2, '충남 아산시 신창면 순천향로 22'),
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
