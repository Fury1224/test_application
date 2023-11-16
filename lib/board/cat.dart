import 'package:flutter/material.dart';
class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  // 게시글 만드는 함수
  InkWell createBoard(String name, String address){
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        height: 300, width:double.maxFinite,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5,0,0,0),
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              height: 110,
              child: Row( // 윗컬럼 Row
                children: [
                  Container(  // 프로필 사진, box 사이즈에 맞춰서 표시
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue),
                        image: DecorationImage(image: AssetImage('assets/1234.jpg'), fit: BoxFit.fill)),
                    width: 100,
                  ),  // 프로필 사진, box 사이즈에 맞춰서 표시
                  Container(  // 이름, 주소
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                    width:260,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: 50,
                          child: Text(name, style: TextStyle(fontSize:20),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,5,0,0),
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: 50,
                          child: Text(address, style: TextStyle(fontSize:15),),
                        ),
                      ],
                    ),
                  ),  // 이름, 주소
                  Container(  // 요금, 돌보미 정보
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                    width:140,
                    child: Column(
                      children: [
                        Container(  // 요금
                          //padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: 50,
                          child: Text('1시간\t: 10,000원\n  1박   : 50,000원', style: TextStyle(fontSize:15),),
                        ),
                        Container(  // 돌보미 정보
                          margin: EdgeInsets.fromLTRB(0,5,0,0),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: 50,
                          child: Text('#여성 #21세 #1인가구 \n#반려동물있음', style: TextStyle(fontSize:13),),
                        ),
                      ],
                    ),
                  ),  // 요금, 돌보미 정보
                ],
              ),
            ),  // 돌보미 정보
            Container(  // 돌보미 소개 내용
              margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              height: 180,
              child: RichText(
                  maxLines: 6,  // 최대 글 라인 수 6줄
                  text: TextSpan(
                    text: '펫칭톡으로 대화 후 가능한 날짜, 시간 조율 후 매칭 원해요\n'
                        '천안 아산 돌봄 가능 / 평일 주말 공휴일 오전 오후 가능합니다\n'
                        '어렸을 때 부터 반려견들과 함께 크면서 성인이 되면서까지도 함께 지내고 있습니다\n'
                        '저희 부모님만 봐도 잘 못놀러가시는 모습을 봐왔기 때문에 다른 보호자님들에게'
                        ' 조금이나마 보탬이 되고싶어서 돌봄을 시작하게 되었습니다',style: TextStyle(fontSize:20),
                  ),
                  overflow: TextOverflow.ellipsis), // 글이 박스보다 길면 ... 처리
            ),  // 돌보미 소개 내용
          ],
        ),
      ),

      // 게시글 클릭 시 이벤트
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext con) {
            return AlertDialog(
                title: Text("돌봄 신청"),
                content: Container(
                  child: Text("'돌보미 1' 님께 매칭을 신청하시겠습니까?"),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        // 매칭 신청을 넣으면 발생할 이벤트 함수 넣기
                      },
                      child: Text("신청")
                  ),  // 매칭 신청 버튼
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        },
                      child: Text("닫기")
                  )   // 닫기 버튼
                ]
            );
          }
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('고양이')
      ),
      body: Container(  // 글 목록
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: SingleChildScrollView( // 스크롤 가능한 블럭
            scrollDirection: Axis.vertical, // 위 아래로 스크롤
              child: Column(
                  children:<Widget>[
                    // 매개변수 (이름, 주소)
                    createBoard('돌보미 1', '충남 아산시 신창면 순천향로 22'),
                    createBoard('돌보미 2', '충남 아산시 신창면 행목리 497'),
                    createBoard('돌보미 3', '충남 천안시 동남구 만남로 43'),
                    createBoard('돌보미 4', '충남 천안시 서북구 1공딘1길 52'),
                    createBoard('돌보미 5', '충남 천안시 서북구 공원로 196'),
                  ],
              ),
          ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.red), color:Colors.white),
        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
        height:70, width:double.maxFinite,
        child: ElevatedButton(
          child: Text('자동 매칭하기'), style: OutlinedButton.styleFrom(backgroundColor: Colors.red,),
          onPressed: (){
            // 버튼 클릭 시 이벤트 함수 넣기
          },
        ),
      ), 
    );
  }
}
