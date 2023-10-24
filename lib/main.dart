import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '/navigation.dart';

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

  void createData() { // 데이터베이스에 저장
    final userReference = FirebaseFirestore.instance.collection("product").doc(
        "test1");
    userReference.set({
      "address": "성동구 행당동",
      "likes": 10,
    });
  }

  void readData() { // 데이터베이스의 파일 가져와서 출력
    final userReference = FirebaseFirestore.instance.collection("product").doc(
        "test");
    userReference.get().then((value) =>
    {
      print(value.data())
    });
    print("작동");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : const Navigation(),
    );
  }
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