import 'package:flutter/material.dart';
import 'package:my_imc_calc_app/pages/combo_from_api_a/combo_index_page_one.dart';
import 'package:my_imc_calc_app/pages/components/button_index_container_component.dart';
import 'package:my_imc_calc_app/pages/constants/constants_library.dart';

//HERE I AM add a SingleChildScrollView for Study..

class MyIndexProjectsPage extends StatelessWidget {
  const MyIndexProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2.5,
        title: const Text('Index Project Choices'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(5.0),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: TextField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(),
                    label: Text('Search'),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    filled: true,
                    fillColor: Colors.white10,
                    hintText: 'Type the Keyword or a more complex term!',
                    hintStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 22.0),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/calc');
                },
                child: const ButtonIndexContainerComponent(
                    txtButtonTitle: 'imc calculator'),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ComboIndexPageOne(title: theProjectTitleOne),
                  ),
                );
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'combos from Api BR'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/notesHomePageA');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'data from api Exp-01'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/listViewTestA');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'List - Test A'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/notesHomePageB');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'data from api Exp-02'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tabsPageExampleA');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'Tab  c Example A'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tabsPageExampleB');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'Tab Page Example B'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/notesHomePageC');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'data from api Exp-03'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/notesHomePageD');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'data api Exp-04 Page'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/skeletonPageA');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'Skeleton Page Exp 01'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/tabsPageExampleC');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'Tab Page c Msn Filters'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/messageListScreen');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'Message Page - A'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'todo 10...'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'todo 11...'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'todo 12...'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'todo 14...'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/calc');
              },
              child: const ButtonIndexContainerComponent(
                  txtButtonTitle: 'todo 15...'),
            ),
          ],
        ),
      ),
    );
  }
}
