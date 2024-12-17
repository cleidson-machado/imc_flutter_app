// ignore_for_file: avoid_print

abstract class ProcessPayment {

  void payWithCreditCard(double valueToProcess, String valueCardNum){
    print('------------------------------------------');
      print('CREDIT CARD PAYMENT SELECTED.');
  }

  void payWithDebittCard(double valueToProcess, String valueCardNum){}

  void payWithPaypal(double valueToProcess, String valueIdAccount){}

  void payWithSimpleVoucher(double valueToProcess, String valueVoucherType){}

}