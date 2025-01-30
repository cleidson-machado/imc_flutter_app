// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import 'package:my_imc_calc_app/user.dart';

class ModalTest {
  final User user;

  ModalTest(
    this.user,
  );

  Future<void> dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Wait Beware!'),
          content: const Text('You will Need a reason for Logout Action\n'
              'This ensures your account remains secure and protected.' 
              'Logging out helps prevent unauthorized access to your data.\n'
              'Always remember to logout when using shared or public devices.\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('LOGOUT!!'),
              onPressed: () {
                user.logout(); // Error Here!?
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
