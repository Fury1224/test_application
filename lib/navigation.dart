import 'package:flutter/material.dart';
import '/home.dart';
import '/map.dart';
import '/profile.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _navigationState();
}

// !!!!!!! navigation.dart 파일에서는 appBar (상단바) 와 bottomNavigationBar (네비게이션 바) 만 사용한다 !!!!!!!

class _navigationState extends State<Navigation> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            Icon(Icons.star),Icon(Icons.star),
          ],
          leading: Icon(Icons.star),
          title: Text('제목')
      ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            Home(),
            Map(),
            Profile(),
          ],
        )
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.map), label: 'Map'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
