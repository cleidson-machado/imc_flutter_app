import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/first_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/second_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/third_tab_page.dart';

class TabPageExampleB extends StatefulWidget {
  const TabPageExampleB({super.key, required this.title});

  final String title;

  @override
  State<TabPageExampleB> createState() => _TabPageExampleBState();
}

class _TabPageExampleBState extends State<TabPageExampleB> {
  
  String get tabTitleA => 'lista';
  String get tabTitleB => 'mapa';
  String get tabTitleC => 'detalhes';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          title: Text(widget.title),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(tabTitleA.toUpperCase(), style: kTxtTabTitleListTextStyle,),
                // icon: Icon(Icons.home),
              ),
              Tab(
                child: Text(tabTitleB.toUpperCase(), style: kTxtTabTitleListTextStyle,),
                // icon: Icon(Icons.star),
              ),
              Tab(
                child: Text(tabTitleC.toUpperCase(), style: kTxtTabTitleListTextStyle,),
                // icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [
          FirstTabPage(),
          SecondTabPage(),
          ThirdTabPage(),
        ]),
      ),
    );
  }
}
