import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBvWyLEDW0qGbsrD63XKaMWkIxZ104YY70",
      appId: "1:950730854080:android:fec9b9e6ff9f19cc94a725",
      messagingSenderId: "950730854080",
      projectId: "capston-project-a3e21",
    ),
  );
  runApp(const MyApp()); // 앱 구동
}

// 처음 시작 : stless 후 탭

// 코드의 메인
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  void createData() {
    final userReference = FirebaseFirestore.instance.collection("product").doc("test1");
    userReference.set({
      "address" : "성동구 행당동",
      "likes" : 10,
    });
  }
  void readData() {
    final userReference = FirebaseFirestore.instance.collection("product").doc("test");
    userReference.get().then((value)=>{
      print(value.data())
    });
    print("작동");
  }
  // 아이콘 Icon(Icons.)
  // 텍스트 Text('')
  // 이미지 넣기 Image.asset('1694703774.png') 또는 assets/dog.png
  // 네모박스 Container( width:50, height:50, color: Colors.blue)
  // 또는 Sizedbox() Flutter의 단위는 LP 50LP==1.2cm

  // Scaffold() 앱을 상중하로 나눔
  // 여러 위젯 가로로 배치 Row( children : [] ) 세로는 Column 후 동일
  // 가로 세로 정렬  mainAxisAlignment: MainAxisAlignment. crossAxisAlignment: CrossAxisAlignment.

  // ctrl + spaceBar = 자동완성 기능

  // 마진, 패딩주기 margin : EdgeInsets.fromLTRB()
  // 테두리 주기 decoration : BoxDecoration 이거 쓰면 부모에 color 제거 해야 함 중복

  // double.infinity 부모를 넘지 않는 선에서 무한히

  // 텍스트 꾸미기 Text(style: TextStyle(  ))

  // 버튼 위젯 TextButton() IconButton() ElevatedButton()
  // TextButton(child: Text('버튼'), onPressed: (){},)
  //aaabbb
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(
            actions: [
              Icon(Icons.star),Icon(Icons.star),
            ],
            leading: Icon(Icons.star),
            title: Text('제목')
        ),
        body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(  // 이미지 박스
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    width:200, height:200,
                    child: Image.asset('1234.jpg'),
                  ),
                  Container(  // 설명칸 박스
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    width: 400, height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    Container(  // 상품이름
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          width:380, height:70,
                          child: Text('캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함', style: TextStyle(fontSize:25),)
                      ),
                    Container(  // 위치정보
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          width:380, height:30,
                          child: Text('성동구 행당동 끌올 10분전')
                      ),
                    Container(  // 가격
                          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                          width:380, height:30,
                          child: Text('210,000원', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                      ),
                    Container(  // 좋아요 개수
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        width:380, height:40,
                      ),
                      ],
                    )
                  ),
                ],
              ),
              ElevatedButton(onPressed: (){
                readData();
              },
                  child: Text("button"),
              )
            ],
          ),
        ),
      ),
    );
  }
}



//네비게이션바 만들기
//bottomNavigationBar: BottomAppBar(
//           child: SizedBox(
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Icon(Icons.phone),
//                 Icon(Icons.message),
//                 Icon(Icons.contact_page),
//               ]
//             ),
//           ),
//         ),