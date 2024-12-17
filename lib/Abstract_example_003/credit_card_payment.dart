// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:my_imc_calc_app/Abstract_example_003/process_payment.dart';

class CreditCardPayment extends ProcessPayment {

  @override
  void payWithCreditCard(double valueToProcess, String valueCardNum) {
    super.payWithCreditCard(valueToProcess, valueCardNum);

    print('------------------------------------------');
      print('The Cash is: $valueToProcess and The Card Num is: $valueCardNum | and Size: ${valueCardNum.length}');
    print('------------------------------------------');

    //print('$string has ${string.length} letters');

  }

}

void main(){

  CreditCardPayment pay = CreditCardPayment();
  pay.payWithCreditCard(123.99, 'AS333444151');


}

