import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages/third_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages_list_filter_msn/list_all_messages_tab_page.dart';
import 'package:my_imc_calc_app/pages/tabs_tabbar_layout/tabs_pages_list_filter_msn/list_read_messages_tab_page.dart';

class TabPageExampleC extends StatefulWidget {
  const TabPageExampleC({super.key, required this.title});

  final String title;

  @override
  State<TabPageExampleC> createState() => _TabPageExampleCState();
}

class _TabPageExampleCState extends State<TabPageExampleC> {
  String get tabTitleA => 'All';
  String get tabTitleB => 'Read';
  String get tabTitleC => 'Archive';

  int enableFilterButton = 0;

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
          actions: [
            if(enableFilterButton == 0)
            IconButton(
              icon: const Icon(Icons.filter_alt),
              tooltip: 'Show Snackbar',
              onPressed: () { ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ],
          bottom: TabBar(
            onTap: (value) {
                setState(() {
                  enableFilterButton = value;
                });
              },
            tabs: [
              Tab(
                child: Text(
                  tabTitleA.toUpperCase(),
                  style: kTxtTabTitleListTextStyle,
                ),
                // icon: Icon(Icons.home),
              ),
              Tab(
                child: Text(
                  tabTitleB.toUpperCase(),
                  style: kTxtTabTitleListTextStyle,
                ),
                // icon: Icon(Icons.star),
              ),
              Tab(
                child: Text(
                  tabTitleC.toUpperCase(),
                  style: kTxtTabTitleListTextStyle,
                ),
                // icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListAllMessagesTabPage(idTabMark: enableFilterButton,),
          ListReadMessagesTabPage(idTabMark: enableFilterButton,),
          const ThirdTabPage(),
        ]),
      ),
    );
  }
}
