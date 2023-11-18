import 'package:flutter/material.dart';

void main() {
  runApp(/*const*/ MyApp());
}
class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

/*class MyApp extends StatelessWidget {
  /*const*/ MyApp({super.key});*/
class MyAppState extends State<MyApp> {
    static int c_row= 5, c_col=5, o_row=3, o_col=3;
    int max=0, j=-1, same=0;
    String f_candi='';
    bool fix = false;

    int user=2; //의뢰인(0~2)
    //화면 출력
    String auto='';
    String matching='';

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

  @override
  Widget build(BuildContext context) {
    make_list();
    first();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('matching test')),
        body: ListView(
          children: [
            Text('의뢰인: ' + other[user][0]),
            Text('추천돌보미:' +  second(user)),
            TextButton(
              onPressed: (){
                setState( () {
                  auto=f_candi;
                  if (client[find_f_candi(f_candi)][4] == '') { // 돌보미가 현재 맡은 의뢰가 없으면
                    other[user][2] += ' ' + client[find_f_candi(f_candi)][3]; // 의뢰인의 돌보미로 설정
                    matching+='의뢰인 ' + other[user][0] + '와 돌보미 ' + f_candi + '가 매칭되었습니다\n';
                  }
                  client[find_f_candi(f_candi)][4] = other[user][0];
                  print(other[user][2]);
                  }
                );
              },
              child: Text('자동매칭')
            ),
            Text(auto),
            Text(matching)
          ],
        ),
      )
    );
  }
}