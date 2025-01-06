// ignore_for_file: unused_field

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
  String statusFilterMsn = 'none';

  int enableFilterButton = 0;

  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    void onSelected(BuildContext context, int item) {
      switch (item) {
        case 0:
          setState(() {
            statusFilterMsn = '( Todas )';
            showAll = false;
          });
          break;
        case 1:
          setState(() {
            statusFilterMsn = '( Lidas )';
            showAll = true;
          });
          break;
        case 2:
          setState(() {
            statusFilterMsn = '( NÃO Lidas )';
          });
          break;
      }
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 2.5,
          //title: Text(widget.title),
          title: statusFilterMsn == 'none'
              ? Text(widget.title)
              : Text('${widget.title} $statusFilterMsn'),
          centerTitle: true,
          actions: [
            if (enableFilterButton == 0)
              PopupMenuButton<int>(
                icon: const Icon(Icons.filter_alt),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Center(
                      child: Text('TODAS'),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Center(
                      child: Text('LIDAS'),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Center(
                      child: Text('NÃO LIDAS'),
                    ),
                  )
                ],
              )
          ],
          bottom: TabBar(
            onTap: (value) {
              setState(() {
                enableFilterButton = value;
                if (enableFilterButton == 0) {
                  statusFilterMsn =
                      'none'; //To Clear Title When The Main Tab is Selected!!!
                  // showAll = true;
                }
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
          ListAllMessagesTabPage(listAction: showAll,),
          ListReadMessagesTabPage(idTabMark: enableFilterButton),
          const ThirdTabPage(),
        ]),
      ),
    );
  }
}
