import 'package:flutter/material.dart';
class Cat extends StatefulWidget {
  const Cat({super.key});

  @override
  State<Cat> createState() => _CatState();
}

class _CatState extends State<Cat> {
  static int c_row= 5, c_col=5, o_row=3, o_col=3;
  int max=0, j=-1, same=0;
  String f_candi='';
  bool fix = false;

  int user=1; //의뢰인(0~2)
  String matching=''; // 매칭된 상대 이름

  final client = List.generate(c_row, (index) => List.generate(c_col, (j)=>'')); //애정도, 강아지를 돌본 횟수, 고양이를 돌본 횟수, 이름, 매칭 상대
  final other = List.generate(o_row, (index) => List.generate(o_col, (j)=>'')); //의뢰인 이름, 강아지(1)or고양이(2)or둘다(3), 매칭 상대
  final candi = List.generate(c_row, (index) => ''); //매칭 후보


  void make_list() {
    if (fix == false) {
      client[0][0] = '90'; client[0][1] = '5'; client[0][2] = '1'; client[0][3] = '돌보미1'; client[0][4] = '';
      client[1][0] = '70'; client[1][1] = '0'; client[1][2] = '8'; client[1][3] = '돌보미2'; client[1][4] = '';
      client[2][0] = '90'; client[2][1] = '3'; client[2][2] = '4'; client[2][3] = '돌보미3'; client[2][4] = '';
      client[3][0] = '90'; client[3][1] = '4'; client[3][2] = '1'; client[3][3] = '돌보미4'; client[3][4] = '';
      client[4][0] = '90'; client[4][1] = '0'; client[4][2] = '2'; client[4][3] = '돌보미5'; client[4][4] = '';

      other[0][0] = '의뢰인1'; other[0][1] = '1'; other[0][2] = '';
      other[1][0] = '의뢰인2'; other[1][1] = '2'; other[1][2] = '';
      other[2][0] = '의뢰인3'; other[2][1] = '3'; other[2][2] = '';
      fix = true;
    }
  }

  void first() { //애정도가 높거나 같은 사용자를 candi에 이름만 저장
    j=-1; same=0; max = int.parse(client[0][0]); //초기화
    for (int i=0; i<c_row; i++) {
      if (max < int.parse(client[i][0])) { //애정도가 클 때
        max = int.parse(client[i][0]);
        if (same != 0) { //중복 제거
          for (int p=same-1; p>0; p--) candi[p]='';
        }
        candi[j] = client[i][3];
        same=0;
      }
      else if (max == int.parse(client[i][0])) //중복
          {
        j++;
        if (i != 0) same+=2;
        candi[j] = client[i][3];
      }
    }
    print(candi);
  }

  String second(int user) { //돌보미 횟수로 사용자 고름
    if (other[user][1] == '1') {
      //후보 중 강아지를 돌본 횟수가 높은 사용자를 고름
      j=0; max=0;
      for (int i=0; i<candi.length; i++){
        if (client[i][3] == candi[j]) {
          if (max <= int.parse(client[i][1]) && client[i][4] == '') {
            max = int.parse(client[i][1]);
            f_candi = candi[j];
          }
          j++;
        }
      }
    }
    else if (other[user][1] == '2') {
      //후보 중 고양이를 돌본 횟수가 높은 사용자를 고름
      j=0; max=0;
      for (int i=0; i<candi.length; i++){
        if (client[i][3] == candi[j]) {
          if (max <= int.parse(client[i][2]) && client[i][4] == '') {
            max = int.parse(client[i][2]);
            f_candi = candi[j];
          }
          j++;
        }
      }
    }
    else if (other[user][1] == '3') {
      //후보 중 강아지와 고양이를 돌본 횟수가 높은 사용자를 고름
      j=0; max=0;
      for (int i=0; i<candi.length; i++){
        if (client[i][3] == candi[j]) {
          int p1 = int.parse(client[i][1]); int p2 = int.parse(client[i][2]); int plus = p1+p2;
          if (max <= plus && client[i][4] == '') {
            max = plus;
            f_candi = candi[j];
          }
          j++;
        }
      }
    }
    return f_candi;
  }

  int find_f_candi(candi) {
    for (int i=0; i<client.length; i++) {
      if (client[i][3] == candi) {
        return i;
      }
    }
    return 0;
  }


  // 게시글 만드는 함수
  InkWell createBoard(double deviceWidth, double deviceHeight, String name, int imageNum, String address){
    return InkWell(
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        height: deviceHeight*0.27, width:double.maxFinite,
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
                    width:deviceWidth*0.45,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: deviceHeight*0.05,
                          child: Text(name, style: TextStyle(fontSize:deviceWidth*0.045),),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0,3,0,0),
                          padding: EdgeInsets.all(3),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: deviceHeight*0.04,
                          child: Text(address, style: TextStyle(fontSize:deviceWidth*0.03),),
                        ),
                      ],
                    ),
                  ),  // 이름, 주소
                  Container(  // 요금, 돌보미 정보
                    decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
                    width: deviceWidth*0.27,
                    child: Column(
                      children: [
                        Container(  // 요금
                          //padding: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                          height: deviceHeight*0.05,
                          child: Text('1시간\t: 10,000원\n  1박   : 50,000원', style: TextStyle(fontSize:deviceWidth*0.034),),
                        ),
                        Container(  // 돌보미 정보
                          margin: EdgeInsets.fromLTRB(0,3,0,0),
                          alignment: Alignment.centerLeft,  // 박스 왼쪽으로 붙이기
                          decoration: BoxDecoration(border: Border.all(color: Colors.red), color: Colors.white38,),
                          height: deviceHeight*0.04,
                          child: Text('#여성 #21세 #1인가구 \n#반려동물있음', style: TextStyle(fontSize:deviceWidth*0.027,)),
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
              height: deviceHeight*0.16,
              child: RichText(
                  maxLines: 6,  // 최대 글 라인 수 6줄
                  text: TextSpan(
                    text: '펫칭톡으로 대화 후 가능한 날짜, 시간 조율 후 매칭 원해요\n'
                        '천안 아산 돌봄 가능 / 평일 주말 공휴일 오전 오후 가능합니다\n'
                        '어렸을 때 부터 반려견들과 함께 크면서 성인이 되면서까지도 함께 지내고 있습니다\n'
                        '저희 부모님만 봐도 잘 못놀러가시는 모습을 봐왔기 때문에 다른 보호자님들에게'
                        ' 조금이나마 보탬이 되고싶어서 돌봄을 시작하게 되었습니다',style: TextStyle(fontSize:deviceWidth*0.035, color: Colors.black),
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
                  child: Text("$name 님께 매칭을 신청하시겠습니까?"),
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
                      child: Text("취소")
                  )   // 닫기 버튼
                ]
            );
          }
        );
      },
    );
  }

  Widget build(BuildContext context) {
    // 사용하는 디바이스 크기
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    make_list();
    first();
    int check_matching = 0; // 자동 매칭 횟수 카운트
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
                    // 매개변수 (디바이스 너비, 높이, 이름, 이미지 파일, 주소)
                    createBoard(deviceWidth, deviceHeight, '돌보미 1', 1, '충남 아산시 신창면 순천향로 22'),
                    createBoard(deviceWidth, deviceHeight, '돌보미 2', 2, '충남 아산시 신창면 행목리 497'),
                    createBoard(deviceWidth, deviceHeight, '돌보미 3', 3, '충남 천안시 동남구 만남로 43'),
                    createBoard(deviceWidth, deviceHeight, '돌보미 4', 4, '충남 천안시 서북구 1공딘1길 52'),
                    createBoard(deviceWidth, deviceHeight, '돌보미 5', 5, '충남 천안시 서북구 공원로 196'),
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
          onPressed: () async{
            // 자동 매칭
            matching = second(user);
            String content_text = '$matching 님이 매칭되었습니다'; // 팝업창에 띄울 텍스트
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState){
                        return Container(
                          height: deviceHeight*0.15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // 매칭된 상대 출력
                              Text('$content_text'),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: (){
                                        setState((){
                                          // 매칭 신청을 넣으면 발생할 이벤트 함수 넣기
                                        });
                                      },
                                      child: Text('매칭 수락'),
                                    ),
                                    ElevatedButton(
                                      onPressed: (){
                                        setState( () {
                                          if(check_matching > candi.length-3){ // 자동매칭 횟수가 돌보미 숫자보다 높으면
                                            content_text = '$matching 님이 매칭되었습니다\n더 이상 매칭할 상대가 없습니다';
                                          }
                                          else{
                                            if (client[find_f_candi(f_candi)][4] == '') { // 돌보미가 현재 맡은 의뢰가 없으면
                                              other[user][2] += ' ' + client[find_f_candi(f_candi)][3]; // 의뢰인의 돌보미로 설정
                                            }
                                            client[find_f_candi(f_candi)][4] = other[user][0];
                                            print(other[user][2]);
                                            matching = second(user);  // 다시 매칭
                                            content_text = '$matching 님이 매칭되었습니다';  // 팝업창 내용 변경
                                            check_matching++; // 팝업창 내용 변경
                                          }
                                        });
                                      },
                                      child: Text('다시 매칭'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    ),
                  );
                }
            );
          },
        ),
      ), 
    );
  }
}
