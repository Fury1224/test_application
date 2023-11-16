import 'package:flutter/material.dart';
import '/home.dart';
import '/map.dart';
import '/profile.dart';
class Dog extends StatefulWidget {
  const Dog({super.key});

  @override
  State<Dog> createState() => _dogState();
}

class _dogState extends State<Dog> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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