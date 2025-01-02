import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/second_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/third_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages_list_filter_msn/list_messages_tab_page.dart';

class TabPageExampleC extends StatefulWidget {
  const TabPageExampleC({super.key, required this.title});

  final String title;

  @override
  State<TabPageExampleC> createState() => _TabPageExampleCState();
}

class _TabPageExampleCState extends State<TabPageExampleC> {
  
  String get tabTitleA => 'All Mess...'; 
  String get tabTitleB => 'Read';
  String get tabTitleC => 'Archive';

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
        body: const TabBarView(
          children: [
          ListMessagesTabPage(),
          SecondTabPage(),
          ThirdTabPage(),
        ]),
      ),
    );
  }
}
