// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/modules/main_contents/profile/screens/main_content_profile_screen.dart';
import 'package:my_imc_calc_app/modules/main_contents/relation/screens/main_content_relation_screen.dart';
import 'package:my_imc_calc_app/modules/main_contents/topic/screens/main_content_topic_screen.dart';

//RE-APROVEITA OS CÓDIGOGOS E VOLTA O NOME HomeScreen SE NECESSÁRIO...

class HomeContentTabScreen extends StatefulWidget {
  const HomeContentTabScreen({super.key});

  @override
  _HomeContentTabScreenState createState() => _HomeContentTabScreenState();
}

class _HomeContentTabScreenState extends State<HomeContentTabScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MainContentTopicScreen(),
    const MainContentProfileScreen(),
    const MainContentRelationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        height: 65,
        iconSize:45,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news_solid),
            label: "TEMAS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3_fill),
            label: "RELAÇÕES",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear_alt_fill),
            label: "PERFIL",
          ),
        ],
      ),
    );
  }
}